﻿using System.ComponentModel.DataAnnotations;

namespace BrainBoxAPI.Models
{
    public class Tag
    {
        [Key]
        public int TagId { get; set; }
        public string TagName { get; set; }
        public string? Description { get; set; }
    }
}
