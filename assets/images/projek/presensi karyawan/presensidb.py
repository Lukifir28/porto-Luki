from tkinter import *
from tkinter import messagebox
import sqlite3, sys
from sqlite3 import Error
import numpy as np
import cv2


#-------------------------------------------------------Inisialisasi cascade--------------------------------------------------------
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier('haarcascade_eye.xml')

#-------------------------------------------------------Inisialisasi database-------------------------------------------------------

DATB = 'pegawai'
FILE = 'image.jpg'

try:
    db = sqlite3.connect("pegawai.db")
    cursor = db.cursor()
    print('>> Koneksi berhasil')
except Exception as e:
        print('>> Koneksi gagal')

#-------------------------------------------------------Face-Eye detector--------------------------------------------------------
def deteksi ():
    cap = cv2.VideoCapture(2, cv2.CAP_DSHOW)
    
    while True:
        ret, img = cap.read()
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.1, 4)
        for (x,y,w,h) in faces:
            cv2.rectangle(img, (x,y), (x+w, y+h), (255,0,0), 2)
            roi__gray = gray[y:x+w, x:x+w]
            roi_color = img[y:y+h, x:x+w]
            cv2.imwrite('Image.jpg', roi_color)
            eyes = eye_cascade.detectMultiScale(gray, 1.1, 4)
            for (ex,ey,ew,eh) in eyes:
                cv2.rectangle(roi_color, (ex,ey), (ex+ew, ey+eh), (0,255,0), 2)
        cv2.imshow('Sedang mendeteksi wajah...', img)
        k = cv2.waitKey(30) & 0xff
        if k==27:
            break
    cap.release()
    cv2.destroyAllWindows()

#----------------------------------MENYIMPAN DATA KE DATABASE----------------------------

def simpan ():
    nama = nama_k.get()
    jabatan = jabatan_k.get()

    try:
        db1 = sqlite3.connect("pegawai.db")
        cursor1 = db1.cursor()
        print('>> Terhubung ke database')
        try:
            try:
                with open(FILE, 'rb') as File:
                    data_biner = File.read()
                perintahSQL1 = ("INSERT INTO presensi (Nama, Jabatan, Foto)" "VALUES (?,?,?)")
                cursor1.execute(perintahSQL1, (nama, jabatan, data_biner,))
                db1.commit()
                print('>> Berhasil menyimpan data ke database')
            except Exception as e:
                print('>> Gagal menyimpan data ke database')
                print(e)
        except Exception as e:
            print('Tabel tidak tersedia')
            print(e)
    except Exception as e:
        print('>> Gagal terhibung ke database')

#--------------------------------------------------Menghapus sisa input---------------------------------------------
def hapus ():
    nama_k.delete(0, END)
    jabatan_k.delete(0, END)

#--------------------------------------------------Fungsi untuk Tombol HADIR-----------------------------------------
def hadir():
    deteksi()
    simpan()
    hapus()
    messagebox.showinfo('Status Presensi', 'Presensi Berhasil!')

#--------------------------------------------------Tampilan GUI------------------------------------------------------
root = Tk()
root.title("Presensi Pegawai")

kanvas = Canvas(root, height=700, width=1200)
kanvas.pack()
frame1 = Frame(root, bg="#00003a")
frame1.place(relheight=1, relwidth=1)
frame2 = Frame(frame1, bg="#4499ff")
frame2.place(relheight=0.7, relwidth=1, rely=0.2, relx=0)
frame3 = Frame(frame2, bg="#4499ff")
frame3.place(relheight=0.6, relwidth=0.8, rely=0.2, relx=0.1)
legenda = Label(frame1, text="PRESENSI PEGAWAI", bg="#00003f", fg="#ffffff", font="Arial 50")
legenda.place(relheight=0.2, relwidth=1, rely=0)
nama_1 = Label(frame3, text="Nama Lengkap", bg="#4499ff", fg="#000000", font="Arial 20")
nama_1.place(relheight=0.1, relwidth=0.6, rely=0.05, relx=0.2)
nama_k = Entry(frame3, bg="#ffffff", fg="#000000", font="Arial 20")
nama_k.place(relheight=0.15, relwidth=0.5, rely=0.15, relx=0.25)
jabatan_1 = Label(frame3, text="Jabatan",bg="#4499ff", fg="#000000", font="Arial 20")
jabatan_1.place(relheight=0.1, relwidth=0.6, rely=0.4, relx=0.2)
jabatan_k = Entry(frame3, bg="#ffffff", fg="#000000", font="Arial 20")
jabatan_k.place(relheight=0.15, relwidth=0.5, rely=0.5, relx=0.25)
hadir_t = Button(frame2, text="HADIR", bg="#9a0000", fg="#ffffff", font="Arial 20", command=hadir)
hadir_t.place(relheight=0.2, relwidth=0.2, rely=0.65, relx=0.4)

root.mainloop()