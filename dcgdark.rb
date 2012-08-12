dep 'summon toolchain' do
  requires 'summon toolchain script fetched',
           'libmpc.managed',
           'libftdi.managed',
           'mpfr.managed',
           'gmp.managed'
  # TODO
end

dep 'libmpc.managed'
dep 'libftdi.managed'
dep 'mpfr.managed'
dep 'gmp.managed'
