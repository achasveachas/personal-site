document.addEventListener('DOMContentLoaded', function() {
    initializeTalkDescriptions();
    
    document.querySelectorAll('.read-more-link').forEach(function(link) {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const talkId = this.getAttribute('data-talk-id');
            toggleDescription(talkId);
        });
    });
});

function toggleDescription(talkId) {
    const description = document.getElementById('description-' + talkId);
    const toggleLink = document.getElementById('toggle-' + talkId);
    
    if (description.classList.contains('truncated')) {
        description.classList.remove('truncated');
        toggleLink.textContent = 'Show less';
    } else {
        description.classList.add('truncated');
        toggleLink.textContent = 'Show more';
    }
}

function initializeTalkDescriptions() {
    document.querySelectorAll('.talk-description').forEach(function(desc) {
        const toggleLink = document.getElementById('toggle-' + desc.id.split('-')[1]);
        
        if (desc.scrollHeight <= desc.offsetHeight + 10) {
            toggleLink.style.display = 'none';
        }
    });
}