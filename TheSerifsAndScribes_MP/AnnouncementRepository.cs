using System;
using System.Collections.Generic;
using System.Linq;

namespace TheSerifsAndScribes_MP
{
    public class AnnouncementItem
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public DateTime CreatedAt { get; set; }
        public bool IsArchived { get; set; }
    }

    public static class AnnouncementRepository
    {
        private static readonly object _lock = new object();
        private static readonly List<AnnouncementItem> _items = new List<AnnouncementItem>();

        static AnnouncementRepository()
        {
            Seed();
        }

        public static IEnumerable<AnnouncementItem> GetAll()
        {
            lock (_lock)
            {
                return _items
                    .OrderByDescending(a => a.CreatedAt)
                    .ToList();
            }
        }

        public static IEnumerable<AnnouncementItem> GetActive()
        {
            lock (_lock)
            {
                return _items
                    .Where(a => !a.IsArchived)
                    .OrderByDescending(a => a.CreatedAt)
                    .ToList();
            }
        }

        public static AnnouncementItem Get(Guid id)
        {
            lock (_lock)
            {
                return _items.FirstOrDefault(a => a.Id == id);
            }
        }

        public static void Add(string title, string body)
        {
            if (string.IsNullOrWhiteSpace(title) || string.IsNullOrWhiteSpace(body))
            {
                throw new ArgumentException("Title and body are required.");
            }

            lock (_lock)
            {
                _items.Add(new AnnouncementItem
                {
                    Id = Guid.NewGuid(),
                    Title = title.Trim(),
                    Body = body.Trim(),
                    CreatedAt = DateTime.Now,
                    IsArchived = false
                });
            }
        }

        public static void Delete(Guid id)
        {
            lock (_lock)
            {
                var existing = _items.FirstOrDefault(a => a.Id == id);
                if (existing != null)
                {
                    _items.Remove(existing);
                }
            }
        }

        public static void ToggleArchive(Guid id)
        {
            lock (_lock)
            {
                var existing = _items.FirstOrDefault(a => a.Id == id);
                if (existing != null)
                {
                    existing.IsArchived = !existing.IsArchived;
                }
            }
        }

        private static void Seed()
        {
            if (_items.Any())
            {
                return;
            }

            _items.AddRange(new[]
            {
                new AnnouncementItem
                {
                    Id = Guid.NewGuid(),
                    Title = "City Hall maintenance",
                    Body = "City Hall services will be temporarily relocated on April 2 while lobby upgrades are completed.",
                    CreatedAt = DateTime.Now.AddDays(-3),
                    IsArchived = false
                },
                new AnnouncementItem
                {
                    Id = Guid.NewGuid(),
                    Title = "Scholarship applications open",
                    Body = "The Binan Scholars program is accepting applications until May 15. Submit requirements at the Education Office.",
                    CreatedAt = DateTime.Now.AddDays(-7),
                    IsArchived = false
                },
                new AnnouncementItem
                {
                    Id = Guid.NewGuid(),
                    Title = "Traffic advisory",
                    Body = "Expect road closures along Plaza Rizal on March 30 for the heritage parade. Please use alternate routes.",
                    CreatedAt = DateTime.Now.AddDays(-10),
                    IsArchived = true
                }
            });
        }
    }
}
