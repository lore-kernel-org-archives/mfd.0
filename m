Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552443D4E9
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854060; cv=none; b=qrtOqcsvp4oey4+2grZVolN/Inrb3HYWliN5eUvmWfqY1IfnMqO0g4FraoHWDZp/JmfGy0NHgrF3sw7UrydC4Bep8dLgfqQzsnDpt/Srgacu5j18fFI9RWyVZjj8IoVXRF5BHNAFKEfEyjTSKx0epGmbEPA/INd7/CLVB60oVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854060; c=relaxed/simple;
	bh=cbBS4iWNcPPG+loScfyFMqof0GT57839RfkR8d+D8M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlPfIPQhHwKFo+IFFoDMNwBnQf/YlrbDW/RYiHpHM3swzVLnMvPR2EiHmP+t/ywHh857YeZqDpoQt9kC413rmp3JGdLE8jUeVyEUL2/QxYc4ILD9Xu1Zhq8rpfj55zeIx1XWNbXYq3zH5nac79JxT1urBMXjXVZ+jI0JGPxkSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQnrPk/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQnrPk/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E331F00ADE
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785854047;
	bh=cbBS4iWNcPPG+loScfyFMqof0GT57839RfkR8d+D8M4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZQnrPk/A4gJm0G7Ds4mJLU8mMO+/+g5pyecJsOe8IU0As5H0HYVZH2a95KBdlUgiB
	 3fvZLpgZnwWjUNEdCN5Q+BtnstxgRMJoQ9ms1BspAD8o6NYD4xngo60ViKP9VcbncT
	 qmNj6Q1HSYX0YlWDdtEp9wtmhVy9bfBz7KDeyoMwttIN7USS7o9TCWbMrIIaTK1wES
	 nNQGN4/gL90MQ5o9Bgu+wL9GJCS83YjpDEeAPdTIm4E/B6o+RAlz9rd3xM9/i13viz
	 3o8cQZOeqink2R1doppfUI2DQIBIeNbukuWURri9Hsj6gBuSbfv07j+H5L1kdZcJWR
	 xdhyHObDkHXBQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15e2dab83eso664952766b.1
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 07:34:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrdg0h/kWfxJutNJ3S5zd61ofCIaqP9mRoamQHYVOomEUroijQ3R53kzGL9Qm+hEuTUEh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzovCdLL50+fkELG8ZJWtOfB55HKs9yTOs/N15uJNToOr7JJoVZ
	/mPRIyBxrPNBxvl4bpSztLhGezKgD12YmwtpS0QuECV5hAVrKOjcBoo5fzHAzFOhD6mLVYcfvsa
	u4AU8xPmC7+MFLJHKntFjxKn1jc/tHL0=
X-Received: by 2002:a17:907:3e05:b0:c1c:285a:475c with SMTP id
 a640c23a62f3a-c1fe816754cmr1272883366b.10.1785854046021; Tue, 04 Aug 2026
 07:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com> <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
 <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com> <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
 <94FDE4B9-CE06-4596-9965-25A70E5A2E3F@gmail.com>
In-Reply-To: <94FDE4B9-CE06-4596-9965-25A70E5A2E3F@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Aug 2026 22:33:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5VhwHyBtaf8uXDxiq-6-CyvC1PNsrjL3hwZ+uVuF33cg@mail.gmail.com>
X-Gm-Features: AUfX_mwnFE8CDIpymkfU_DWLFlxsQ41JeST4qlFRGRfXlwvEYS2ZtV0tTlBno4c
Message-ID: <CAAhV-H5VhwHyBtaf8uXDxiq-6-CyvC1PNsrjL3hwZ+uVuF33cg@mail.gmail.com>
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

On Tue, Aug 4, 2026 at 12:09=E2=80=AFAM Miao Wang <shankerwangmiao@gmail.co=
m> wrote:
>
> Hi,
>
> > 2026=E5=B9=B48=E6=9C=883=E6=97=A5 21:45=EF=BC=8CHuacai Chen <chenhuacai=
@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Jul 31, 2026 at 4:24=E2=80=AFPM Miao Wang <shankerwangmiao@gmai=
l.com> wrote:
> >>
> >> Hi,
> >>
> >>> 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen <chenhua=
cai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>> On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang <shankerwangmiao@gm=
ail.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen <chenh=
uacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >>>>>
> >>>>> Hi, Miao,
> >>>>>
> >>>>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
> >>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
> >>>>>>
> >>>>>> Previously, the driver has been introduced to support the Loongson=
 2K
> >>>>>> BMC running on the Loongson Servers, which is essential to prevent
> >>>>>> the system from hanging when the BMC is being reset and the defaul=
t
> >>>>>> efi-framebuffer is being used. However, there are some drawbacks i=
n the
> >>>>>> driver.
> >>>>>>
> >>>>>> Firstly, the driver tries to read and write to the connected PCI-E=
 host
> >>>>>> controller registers, assuming that the BMC is connected to LS7A P=
CI-E
> >>>>>> host controller. This assumption should be true for real products,=
 but
> >>>>>> to prevent from accidentally reading and writing to the wrong PCI-=
E host
> >>>>>> controller, this driver should be modified to check this before
> >>>>>> accessing the registers.
> >>>>>>
> >>>>>> Secondly, the driver uses non-exported functions to tell the vt
> >>>>>> subsystem to redraw the screen, preventing the driver from being
> >>>>>> compiling as a module. This can be fixed by using the exported
> >>>>>> functions instead.
> >>>>> You can replace the redraw function, but I don't think it is necess=
ary
> >>>>> to make the bmc driver modular.
> >>>>>
> >>>>> BMC core, IPMI and simpledrm display are usually (if not always)
> >>>>> supposed to work as early as possible.
> >>>>
> >>>> I believe that it should be the user's decision to choose whether to
> >>>> compile a module into the kernel or as a module and it would be bett=
er
> >>>> if we can provide the possibilities for the user to choose from.
> >>>> Additionally, I don't think these modules are supposed to work that
> >>>> early. The mfd module provide two functions, the display and the ipm=
i
> >>>> device. In the aspect of graphical display, without this module, the
> >>>> user can still see the output during booting on their monitors, sinc=
e
> >>>> efifb is working, providing a basic display function. In the aspect =
of
> >>>> the ipmi device, I don't think the lack of such device will influenc=
e
> >>>> the boot of the system, since it is a common practice to compile ipm=
i
> >>>> device drivers as modules on other architectures. As a result, neith=
er
> >>>> of the two functions are required to be loaded that early and it is
> >>>> reasonable to at lease leave the choice to compile it as a module
> >>>> to the user.
> >>> Flexibility is not always useful, if a config doesn't provide good
> >>> effect, then it just increases complexity and makes maintenance more
> >>> difficult.
> >>
> >> I should emphasize that to allow this driver to be a module, there is
> >> no such increase on maintenance. Moreover, not all loongarch machines
> >> are requiring this driver. Especially only a part of the server models
> >> are quipped with this BMC. Comparing with other architectures, the
> >> driver for BMC are normally compiled as a module, such as mgag200 for
> >> iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
> >> Huawei. None of these BMC drivers requiring to be compiled into the
> >> kernel. I cannot see there is any reason keeping the driver from being
> >> allowed to be compiled as a module. I also do not think it will bring
> >> any significant maintenance burden. Implementing correct cleanup code
> >> should be necessary instead of burden.
> > Can we split into two series, one fix bugs and the others make bmc modu=
lar?
> >
> > Otherwise I don't think we can reach a consensus in the near future.
>
> I accept different opinions on design trade-offs. However, I don't think
> you have provided enough excuses to remain this driver as built-in,
> since I believe normally in kernel, most non-core drivers are all able
> to be compiled as a module. I also provided some examples from devices
> with similar functions. As a result, I'll not split this series before
> there is indeed a strong reason against allowing this driver to be
> compiled as a module or we may have a great benefit if we force this
> module to be compiled built-in.
At least you should remove the first patch from this series. Binbin
Zhou has been fixing it:
https://lore.kernel.org/loongarch/20260616115530.4012675-1-zhoubinbin@loong=
son.cn/
https://lore.kernel.org/loongarch/20260624085550.1508771-1-zhoubinbin@loong=
son.cn/
https://lore.kernel.org/loongarch/20260706021909.2346535-1-zhoubinbin@loong=
son.cn/

Huacai

>
> Cheers,
>
> Miao Wang
