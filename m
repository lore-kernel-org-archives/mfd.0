Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6103A1688
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485238; cv=none; b=S/gEVxkDNcyY0vM/hoXhg9hb3ERfa1TynraszhuyTAaC2/KRIEpEPC9fDEzM7P9rpNgEhA1Ugb613LbhByFsjLzErkd+LPACyxZV+VxZ2uYCBRRhGGEw1ZksxWN96D0ykdMqGHM2IXhVTaRQeSPNl04IhZhIC+XylqBaOpSFhB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485238; c=relaxed/simple;
	bh=B+1oDXnaKDqPJTsbcSpixvwxwpTmis4J1AeFx3/ZBuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9x01+TXnuS2E7XBauufsRWkld57AEbXdp/cRe6Fc8eiB51YUHuPXCD4b6ZIWf3e0FNZLHm6nXBqzY1QJwubakb0WqpKP0hVNUl6i6j1B/WoYiLmLRnLJqioFHJuik8jfA7Ec2Tn/+YoTto0NiRbTuF8R4DAt1Ilv5buYCsMWQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0F3Jnnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0F3Jnnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88A31F00ADF
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785485236;
	bh=B+1oDXnaKDqPJTsbcSpixvwxwpTmis4J1AeFx3/ZBuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l0F3JnnpfV7mygzOQiDF6GhxJ51gDP6WkY/hxk3rJ7p1AL4B8+RjcbC9iJ3fCJGVO
	 WpHYzyt3keXPbeHdDW/hGynrP49lGhNMplhT9W65bt/gkpUBNFfL3QF+KcukoVETDN
	 Vd+n+X6gUZETiTj+F9Q8WjHJjCII4ztuXIMVg3lnRvf1qUfYl+a8Ly/n/7dgOErC1X
	 Lt6eM3vrLqGu1qLdc96SGK5WDjNa3Vd/qCzJ3KE83qmqGEp0c4tU6p+8R2RNWfk+mz
	 2DuoPmECKZtQ8FU3/thP0a8UAAk/w7G9Qj7B9/n47UjNZfTJM4k7J+X9wrHu2gIv4U
	 0Pvu5LxhepVIA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a07a051a81so1241940a12.0
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 01:07:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr2oImLWqVny13X0hhde97YnghibBJeat1/mI1cYHMBpCGYZTNx8WHGW/fY9EBLVNc03V4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzmoPpHdfqJyFmqyUQ72YCzpKv+SUPi701uoUUChz60gbmLWtz
	VSJE+gxCtvd3uv5L+6KYCC0/M+WEmSmNPu7rtb9oj+SUj6syiABN1zBNcQ4xp0XTloCEchYXz6L
	UxF6f9gbCR0IFeflRc7xstCv9lUyhVrQ=
X-Received: by 2002:a05:6402:a505:10b0:69c:79c5:6f5f with SMTP id
 4fb4d7f45d1cf-6a098ceb8bemr342560a12.29.1785485235262; Fri, 31 Jul 2026
 01:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com> <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
In-Reply-To: <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 31 Jul 2026 16:07:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
X-Gm-Features: AUfX_mx1RWUHjW7HMGxJ9gMJs4HeptSqYKI92gRAAXEKGLc1aOGcHpsSUewJEV8
Message-ID: <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/7] mfd: ls2kbmc: multiple fixes for this driver
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang <shankerwangmiao@gmail.co=
m> wrote:
>
> Hi,
>
> > 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen <chenhuaca=
i@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi, Miao,
> >
> > On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
> > <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
> >>
> >> Previously, the driver has been introduced to support the Loongson 2K
> >> BMC running on the Loongson Servers, which is essential to prevent
> >> the system from hanging when the BMC is being reset and the default
> >> efi-framebuffer is being used. However, there are some drawbacks in th=
e
> >> driver.
> >>
> >> Firstly, the driver tries to read and write to the connected PCI-E hos=
t
> >> controller registers, assuming that the BMC is connected to LS7A PCI-E
> >> host controller. This assumption should be true for real products, but
> >> to prevent from accidentally reading and writing to the wrong PCI-E ho=
st
> >> controller, this driver should be modified to check this before
> >> accessing the registers.
> >>
> >> Secondly, the driver uses non-exported functions to tell the vt
> >> subsystem to redraw the screen, preventing the driver from being
> >> compiling as a module. This can be fixed by using the exported
> >> functions instead.
> > You can replace the redraw function, but I don't think it is necessary
> > to make the bmc driver modular.
> >
> > BMC core, IPMI and simpledrm display are usually (if not always)
> > supposed to work as early as possible.
>
> I believe that it should be the user's decision to choose whether to
> compile a module into the kernel or as a module and it would be better
> if we can provide the possibilities for the user to choose from.
> Additionally, I don't think these modules are supposed to work that
> early. The mfd module provide two functions, the display and the ipmi
> device. In the aspect of graphical display, without this module, the
> user can still see the output during booting on their monitors, since
> efifb is working, providing a basic display function. In the aspect of
> the ipmi device, I don't think the lack of such device will influence
> the boot of the system, since it is a common practice to compile ipmi
> device drivers as modules on other architectures. As a result, neither
> of the two functions are required to be loaded that early and it is
> reasonable to at lease leave the choice to compile it as a module
> to the user.
Flexibility is not always useful, if a config doesn't provide good
effect, then it just increases complexity and makes maintenance more
difficult.

Huacai

>
> Cheers,
>
> Miao Wang
>
>
