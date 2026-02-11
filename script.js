document.addEventListener('DOMContentLoaded', function() {

    // --- DYNAMIC NAVBAR ---
    const header = document.querySelector('.header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) header.classList.add('scrolled');
        else header.classList.remove('scrolled');
    });

    // --- HAMBURGER MENU ---
    const hamburger = document.querySelector(".hamburger");
    const navMenu = document.querySelector(".nav-menu");
    hamburger.addEventListener("click", () => {
        hamburger.classList.toggle("active");
        navMenu.classList.toggle("active");
    });
    document.querySelectorAll(".nav-link").forEach(n => n.addEventListener("click", () => {
        hamburger.classList.remove("active");
        navMenu.classList.remove("active");
    }));

    // --- CUSTOM CURSOR (Desktop only) ---
    const cursor = document.querySelector('.cursor');
    const cursorFollower = document.querySelector('.cursor-follower');
    if (window.innerWidth > 768 && cursor) {
        document.addEventListener('mousemove', (e) => {
            cursor.style.left = e.clientX + 'px';
            cursor.style.top = e.clientY + 'px';
            setTimeout(() => {
                cursorFollower.style.left = e.clientX + 'px';
                cursorFollower.style.top = e.clientY + 'px';
            }, 100);
        });
        const interactiveElements = document.querySelectorAll('a, button, .project-card, .slide-card, .cert-card');
        interactiveElements.forEach(el => {
            el.addEventListener('mouseover', () => {
                cursor.classList.add('hover');
                cursorFollower.classList.add('hover');
            });
            el.addEventListener('mouseout', () => {
                cursor.classList.remove('hover');
                cursorFollower.classList.remove('hover');
            });
        });
    }

    // --- TILT EFFECT ON PROJECT CARDS (Desktop only) ---
    if (typeof VanillaTilt !== 'undefined' && window.innerWidth > 768) {
        VanillaTilt.init(document.querySelectorAll("[data-tilt]"), {
            max: 15, speed: 400, glare: true, "max-glare": 0.2,
        });
    }

    // --- REUSABLE SLIDER FUNCTION ---
    function createSlider(trackId, prevBtnId, nextBtnId) {
        const track = document.getElementById(trackId);
        const prevBtn = document.getElementById(prevBtnId);
        const nextBtn = document.getElementById(nextBtnId);
        if (!track || !prevBtn || !nextBtn) return;

        const slides = Array.from(track.children);
        const slideGap = parseInt(getComputedStyle(slides[0]).marginRight) || 0;
        const getSlideWidth = () => slides[0].getBoundingClientRect().width + slideGap;
        
        let currentIndex = 0;

        const setSlidePosition = () => {
            const slideWidth = getSlideWidth();
            track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
        };
        
        nextBtn.addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % slides.length;
            setSlidePosition();
        });
        prevBtn.addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + slides.length) % slides.length;
            setSlidePosition();
        });

        window.addEventListener('resize', setSlidePosition);
    }
    createSlider('exp-track', 'exp-prev', 'exp-next');
    createSlider('cert-track', 'cert-prev', 'cert-next');

    // --- MODAL FOR CERTIFICATES ---
    const modal = document.getElementById('cert-modal');
    const modalGallery = document.querySelector('.modal-gallery');
    const modalClose = document.querySelector('.modal-close');
    const certCards = document.querySelectorAll('.cert-card');

    if (modal && modalGallery && modalClose) {
        certCards.forEach(card => {
            card.addEventListener('click', () => {
                const imagesInCard = card.querySelectorAll('.cert-img');
                
                modalGallery.innerHTML = '';
                imagesInCard.forEach(img => {
                    const clonedImg = img.cloneNode(true);
                    clonedImg.style.display = 'block';
                    modalGallery.appendChild(clonedImg);
                });
                modal.style.display = 'block';
            });
        });

        modalClose.addEventListener('click', () => modal.style.display = 'none');
        window.addEventListener('click', (e) => { if (e.target === modal) modal.style.display = 'none'; });
    }

    // --- SCROLL REVEAL ANIMATION (UNTUK SOFT SKILLS) ---
    const skillTags = document.querySelectorAll('.skill-tag');
    const revealOnScroll = () => {
        skillTags.forEach(element => {
            const elementTop = element.getBoundingClientRect().top;
            const windowHeight = window.innerHeight;
            if (elementTop < windowHeight - 100 && element.style.animationPlayState === 'paused') {
                 element.style.animationPlayState = 'running';
            }
        });
    };
    skillTags.forEach(tag => tag.style.animationPlayState = 'paused');
    window.addEventListener('scroll', revealOnScroll);
    revealOnScroll();

    // --- CONTACT FORM ---
    const contactForm = document.getElementById('contact-form');
    const formNotification = document.getElementById('form-notification');
    if (contactForm && formNotification) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            formNotification.textContent = 'Terima kasih! Pesan Anda telah terkirim (simulasi).';
            formNotification.classList.remove('error');
            formNotification.classList.add('success', 'show');
            
            contactForm.reset();

            setTimeout(() => {
                formNotification.classList.remove('show');
            }, 5000);
        });
    }
});