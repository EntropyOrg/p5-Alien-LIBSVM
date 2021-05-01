package Alien::LIBSVM;
# ABSTRACT: Alien package for the LIBSVM library

use strict;
use warnings;

use parent 'Alien::Base';

sub version {
	my ($class) = @_;

	( "" . $class->SUPER::version) =~ s/^\d/$&./gr;
}

sub inline_auto_include {
	return  [ "svm.h" ];
}
sub libs {
	my ($class) = @_;

	join ' ', (
		$class->install_type eq 'share' ? ('-L' . File::Spec->catfile($class->dist_dir, qw(lib)) ) : (),
		'-lsvm',
	);
}

sub cflags {
	my ($class) = @_;
	join ' ', (
		$class->install_type eq 'share' ? ('-I' . File::Spec->catfile($class->dist_dir, qw(include)) ) : (),
	);
}

sub Inline {
	return unless $_[-1] eq 'C'; # Inline's error message is good
	my $params = Alien::Base::Inline(@_);
}

=method svm_train_path

Path to the C<svm-train> executable.

=cut
sub svm_train_path {
	my ($self) = @_;
	File::Spec->catfile( $self->dist_dir , 'bin', 'svm-train' );
}

=method svm_predict_path

Path to the C<svm-predict> executable.

=cut
sub svm_predict_path {
	my ($self) = @_;
	File::Spec->catfile( $self->dist_dir , 'bin', 'svm-predict' );
}

=method svm_scale_path

Path to the C<svm-scale> executable.

=cut
sub svm_scale_path {
	my ($self) = @_;
	File::Spec->catfile( $self->dist_dir , 'bin', 'svm-scale' );
}

1;
=pod

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<LIBSVM|http://www.csie.ntu.edu.tw/~cjlin/libsvm/>

=cut
