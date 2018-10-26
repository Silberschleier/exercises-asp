function PlotComplex(num1, num2)
    product = num1*num2;
    quotient = num1/num2;
    prod_real = real(product)
    prod_imag = imag(product)
    quot_real = real(quotient)
    quot_imag = imag(quotient)
    plot(prod_real, prod_imag, 'x*', quot_real, quot_imag, 'x*')
    xlabel('Real')
    ylabel('Imag')
    legend('Product', 'Quotient')
endfunction

