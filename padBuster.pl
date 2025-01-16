#!/usr/bin/perl

# ========================================================================
# Enhanced PadBuster v0.3.3
# Original Author: Brian Holyfield - Gotham Digital Science
# Interface Enhancement: [Your Name]
# License: Apache-2.0
# ========================================================================

use strict;
use warnings;
use Term::ANSIColor;       # For terminal colors
use Term::ReadKey;         # For keypress handling
use Time::HiRes;          # For smooth animations
use feature 'say';

# ==== ANIMATION CONFIGURATION ====
my $ANIMATION_SPEED = 0.1;  # Control banner animation speed
my @COLORS = ('bright_blue', 'bright_cyan', 'bright_white');

# ==== Enhanced Banner with Animation ====
sub print_animated_banner {
    my @banner_frames = (
        q{
    ╔═══╗──╔╗────╔╗─╔═══╗╔╗──╔╗╔═══╗╔════╗╔═══╗╔═══╗
    ║╔═╗║──║║────║║─║╔═╗║║║──║║║╔═╗║║╔╗╔╗║║╔══╝║╔═╗║
    ║╚═╝║╔╗║║╔══╗║║─║║─║║║║──║║║╚══╗╚╝║║╚╝║╚══╗║╚═╝║
    ║╔══╝║║║║║╔╗║║║─║╚═╝║║║──║║╚══╗║──║║──║╔══╝║╔╗╔╝
    ║║───║╚╝║║╚╝║║╚╗║╔═╗║║╚═╗║║║╚═╝║──║║──║╚══╗║║║╚╗
    ╚╝───╚══╝╚══╝╚═╝╚╝─╚╝╚══╝╚╝╚═══╝──╚╝──╚═══╝╚╝╚═╝},
        q{
    ▛▀▀▀▜──▛▜────▛▜─▛▀▀▀▜▛▜──▛▜▛▀▀▀▜▛▀▀▀▀▜▛▀▀▀▜▛▀▀▀▜
    ▌▀▀▀▐──▌▐────▌▐─▌▀▀▀▐▌▐──▌▐▌▀▀▀▐▌▀▀▀▀▐▌▀▀▀▐▌▀▀▀▐
    ▌───▐▀▀▌▐▀▀▀▜▌▐─▌───▐▌▐──▌▐▌▀▀▀▐───▌▐──▌▀▀▀▐▌▀▀▀▐
    ▌───▐▄▄▌▐▄▄▄▐▌▐─▌───▐▌▐──▌▐▀▀▀▀▐───▌▐──▌▀▀▀▐▌▄▄▄▐
    ▙▄▄▄▟──▙▟────▙▟─▙▄▄▄▟▙▟▄▄▙▟▙▄▄▄▟───▙▟──▙▄▄▄▟▙▄▄▄▟},
    );

    # Clear screen before animation
    system('clear');

    # Animate each frame
    foreach my $frame (@banner_frames) {
        system('clear');
        foreach my $color (@COLORS) {
            print color($color);
            print $frame;
            print color('reset');
            select(undef, undef, undef, $ANIMATION_SPEED);
        }
    }
    
    # Print version and info
    print color('bright_white');
    print "\n    🔒 Advanced Padding Oracle Attack Tool v0.3.3";
    print "\n    📋 Enhanced Interface Edition";
    print "\n    🔑 Original by Brian Holyfield - Gotham Digital Science";
    print color('reset');
}

# ==== Enhanced Main Menu ====
sub show_menu {
    print color('bold bright_cyan');
    print "\n╔════════════════ MAIN MENU ════════════════╗\n";
    print color('reset');
    
    # Menu items with icons and colors
    my @menu_items = (
        {icon => '🔍', label => 'Decrypt Mode', color => 'green'},
        {icon => '🔒', label => 'Encrypt Mode', color => 'blue'},
        {icon => '🔨', label => 'Brute Force Mode', color => 'red'},
        {icon => '⚙️', label => 'Settings', color => 'yellow'},
        {icon => '❓', label => 'Help', color => 'magenta'},
        {icon => '📤', label => 'Exit', color => 'white'}
    );

    # Print menu items
    for my $i (0..$#menu_items) {
        print color($menu_items[$i]->{color});
        printf "║ %d. %s %s\n", $i+1, $menu_items[$i]->{icon}, $menu_items[$i]->{label};
        print color('reset');
    }
    
    print color('bright_cyan');
    print "╚═══════════════════════════════════════════╝\n";
    print color('reset');
}

# ... [Previous code remains the same]

# ==== Progress Bar with Percentage ====
sub show_progress {
    my ($current, $total) = @_;
    my $width = 40;
    my $percentage = int(($current / $total) * 100);
    my $filled = int(($current / $total) * $width);
    
    print "\r[";
    print color('green');
    print "█" x $filled;
    print color('reset');
    print "░" x ($width - $filled);
    print "] $percentage%";
}

# ==== Enhanced Error Display ====
sub show_error {
    my ($message) = @_;
    print color('bold red');
    print "\n╔═ ERROR ═══════════════════════════╗\n";
    print "║ ⚠️  $message\n";
    print "╚════════════════════════════════════╝\n";
    print color('reset');
}

# Main program execution starts here
main();
