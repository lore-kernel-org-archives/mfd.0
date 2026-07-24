Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6D3E2767
	for <mfd@lists.linux.dev>; Fri, 24 Jul 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885302; cv=none; b=B3YFZZbEZTrbc1Vv62J7aS9oZPifU7gNoNwdsx8x1bEhE4rR7Nf1HwkkNNi2cnu647V8cdWSqsA2WoWHQ9DDT0SDJ3svBibD4EE3H7HAU4bTz8DLJlAp1YEMjpA4Z+r/kih8sNTFZNpwHXvNTHWYacPdcSKQRTNrYV1j/emGgqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885302; c=relaxed/simple;
	bh=JS+IFyx0Nx5QnGWEAUcELDS9dig3ky8MVWpuyJmtYrU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cwomZWBUkqMLN0Bp2UJB4Jd4LdsJSzaaUyLg7mgUXv1gn5qKf+ZuWCQSZIdtXFPHad4ZYgxi9Ck4nF//7ImrF0jqNNLgtODS8aF1FJ6bsqUXfOB4n8utwNVtVJMylE6eSlmvbSxK6YEH+brn1s82H/8XW+8ENJ4mi4V7HvDFeeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsIi8eWl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsIi8eWl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc8311c6ddso362785ad.0
        for <mfd@lists.linux.dev>; Fri, 24 Jul 2026 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784885300; x=1785490100; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JS+IFyx0Nx5QnGWEAUcELDS9dig3ky8MVWpuyJmtYrU=;
        b=nsIi8eWlmJlRqqoEOUj/2dVPJS4eUbcborRm1Xzh63xTvB1nYraVO6+EJ/VK+6RDKg
         Yz8SKf05qfXJFrGo0Ej/N8WatQtHtMQQ7dXC1YZo2y2dGTjA/KwJ+5wQ2Q3Fwtro0plS
         ZyZefhhZQdy0teF/Ke6Qkd+CUjqC4BsmiZ95yIy/J59n1PV21akRtk7sUEWTqlFoQGnY
         aiIjM62zCIg3V021UzhAg2ZBQ706V0bz80sNEBjpN4L5QPoQXMrDOlEqaCYHGGRmMUC+
         gMqC4eHs9BS2uRKfP4VXFD1d7eThMBNAegN5CeBtSVzMO50cIBdXwl/KLQluR2EYU1CV
         PkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784885300; x=1785490100;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JS+IFyx0Nx5QnGWEAUcELDS9dig3ky8MVWpuyJmtYrU=;
        b=ltyuGGYSSxjbZTYeGsTXcs1/avgypI5pyoQBdRfcozxrJfvfs2lnVWyZAaloH64IJ3
         2QDSTq0awPbw4QwsUN6oXjO6aS+oEhazF2mY+jpNDCCjU+Y6ljt30CBwwHo68CDWKNpq
         Xw37H6oAui66bOf0blg5xwgGYBFcUiBNPAldStqYHTLBl4YzH+mTla0QnUOminABWnWm
         NuvCQrRbUKVWdnzBebs97mhqOfwFf8o0c9OWGcmiCC8bgvcxEl5ceyjXFJyV4jIyo3wE
         zWbj47wujTfbgAKNIsG2AFWYm3yHXQ3/8Ku9Jz8Tc+5+52eihYP/vYITQrACpPoFdjFh
         oNUg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2LnzhOeRJGcNspgZd4CTcwjdMQT8pNp6kqpyrd3DbhWwHUGY0iYG6et87FtXR5GngU1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCTlvibqCzD3qa/GnWEYskzjGeLqPOKvc4J2W2/VT78h5ZakNc
	ZX5Kta0W+6E/ZMMYc663uGds7yUlDlpwULeCuwNHFjZHIale+KGfdH13
X-Gm-Gg: AR+sD10wDOtopsFMQCDi++tB9CZTC7H8VfH/yQ/GLhfJ8y28OsqWh59s0u3Ky6lPXZo
	6OJYNgUN5uukWhQe/IGoFBzIUZ8EKT8VFK/39wSJcqQclo67EPZlYQgu6qgwIYMxiigFnknuhFQ
	W2KY7OZs/bVp2b/qYWXTS7dRVZ4UxDcOhwcnLO+L//kxoS2Cw9it41YwF1JnmvvyXI+heSAUTSn
	VvEWXMY7tM6nL2ZLpLScC33vVJgsqmlH126Dw4D8cbePqppKLeIr0QVPlBBJONouvjqENCWLtPs
	cWtlyg+p4YY0bTFsjLqk1KWv5onyKlhUOVJXFH0lFJz/uC4JYPY0wAecB454gDekLHuSfZg7RV5
	TAmWVomUK3RQjNfZeutcKWVZwo2sEU52H0reR7JBcsyNM+JsvX1HVkc5d7xe92gwj0w3r+qEX9C
	/SmpHJxGXLauVdcIlNzM6dSmVS
X-Received: by 2002:a17:902:d550:b0:2ca:d344:7752 with SMTP id d9443c01a7336-2cfbd6a970amr27757825ad.8.1784885300129;
        Fri, 24 Jul 2026 02:28:20 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm48128715ad.55.2026.07.24.02.28.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:28:19 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 0/7] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
Date: Fri, 24 Jul 2026 17:27:58 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi, Miao,
>=20
> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>=20
>> Previously, the driver has been introduced to support the Loongson 2K
>> BMC running on the Loongson Servers, which is essential to prevent
>> the system from hanging when the BMC is being reset and the default
>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>> driver.
>>=20
>> Firstly, the driver tries to read and write to the connected PCI-E =
host
>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>> host controller. This assumption should be true for real products, =
but
>> to prevent from accidentally reading and writing to the wrong PCI-E =
host
>> controller, this driver should be modified to check this before
>> accessing the registers.
>>=20
>> Secondly, the driver uses non-exported functions to tell the vt
>> subsystem to redraw the screen, preventing the driver from being
>> compiling as a module. This can be fixed by using the exported
>> functions instead.
> You can replace the redraw function, but I don't think it is necessary
> to make the bmc driver modular.
>=20
> BMC core, IPMI and simpledrm display are usually (if not always)
> supposed to work as early as possible.

I believe that it should be the user's decision to choose whether to
compile a module into the kernel or as a module and it would be better
if we can provide the possibilities for the user to choose from.
Additionally, I don't think these modules are supposed to work that
early. The mfd module provide two functions, the display and the ipmi
device. In the aspect of graphical display, without this module, the
user can still see the output during booting on their monitors, since
efifb is working, providing a basic display function. In the aspect of
the ipmi device, I don't think the lack of such device will influence
the boot of the system, since it is a common practice to compile ipmi
device drivers as modules on other architectures. As a result, neither
of the two functions are required to be loaded that early and it is
reasonable to at lease leave the choice to compile it as a module
to the user.

Cheers,

Miao Wang


