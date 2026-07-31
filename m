Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195B3C1F41
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486297; cv=none; b=plZ9vwJ27lE0BvTrt2mk1La26o+xfki+oLOQ3EIMfsFAzgcAi1Z+xI8GIuLzeHIFDFbMRsibbgaPsXalxCbKXvqulfx74dQyAo5stawu4qkrgseiB+dAygdsBD/4fatW+jQ6ood7VmJlrpjszztQ2ef/K9kUUVc32cmxVEI1lAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486297; c=relaxed/simple;
	bh=0cRWJ4eKnZR83IAvPi9vpmww2wPNWwtloX3nTeIN+Fg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XlIItLme/XqesQk3wN23WZkqm0rdISfVJLAnApVoMcC+icLy7g8DAm0FMpfwFL57vY8blrmZbvbbqA757pFdhUFqVkkfFI671iPcMO1djv2r+JTXAGbjzHcrMIFkgvihAVa/60RWzKFqs+ZG4yiakKgScsI7gV1bdSNVWL26HHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dq6LExKD; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dq6LExKD"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso49650a12.0
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785486292; x=1786091092; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0cRWJ4eKnZR83IAvPi9vpmww2wPNWwtloX3nTeIN+Fg=;
        b=Dq6LExKDOjuQg3anuKI3zUyu9xowWgwNpf6B0a2S++ulZ7d6M2FQ6z3aINFJxpPIX4
         VkxsUHHZqu16jbtKoqbpT4bpypAETiPoSlfItl5B+gtkULHB7ON5vgzm9JsOtoDh7YrE
         mqxM0+EcQXAVODnBYuJ2UhlpGHS4veQVagPUzdnm29NBbYr5tB7zx5gqPcy0MdT+cC1C
         fg93upYrUmWZS1ig6xqorPQZjp1xjxnZhGaLLpUcU0zxkTchON4jFQQaQKEV4Ri1VvFY
         Zf1IRmbKQ9yeHfnwgUCR4fIqSHvSHkwxBcVfvelfYXK85Dqa7aA/K+O10HFXlfsCzViy
         SJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486292; x=1786091092;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cRWJ4eKnZR83IAvPi9vpmww2wPNWwtloX3nTeIN+Fg=;
        b=c0/Vf0MS8SHr/GEWymOq1i+1Al71ITqDCdLtzhehfi/VznBVbfO8LYw7fYIseSTs0l
         wKZ2f277XCSKb91Bfsxpq1ohqSdg7qmeAKPmzqKVP5rSQcgn7iUN4UTlpmePR7M8rj9n
         HtuLEXk5wT/suyQ9/nmKZ/ob9y8u6IcyXhGKiIuF+N+HAtmfAh1NgD9/MsAKgLna7i+J
         mY5Nq2vXcVTzOtqi3R06X8iYgA8lXORQ5nXuwJ3dqB8xyJ3K5WJC6LjHk0le2MOMjRNT
         4ZdNg8+Kls38qw/BM/nqcS8PeN541VxIyRnc37e0eZtBqno+QNhK7WNxnK8amd8Mt2YX
         D5Qg==
X-Forwarded-Encrypted: i=1; AHgh+RpARRnAB/qFekyBaz7DG/RFh+rhbKZvErRhl1WC4nyemq5Mr6CBhDrx7QfOEm5qLv4UEv0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgrfUR671jHi3DilbcZDmnli3PhJmP/FkuvC4wOn2gkfrsYLMG
	SIDyV6VCNJNekaCO8jcQH5K6lbay45t3eRmQXu+f+QG1/o4uUnEXfQLF
X-Gm-Gg: AR+sD10/rD/ISgYBkkySTXDqPtyadwONU9vOoakSOocHvQvJgrbGSS2OvW5Fu0qHRKp
	sWOKUCZqIbat9VCprXT083K75o9nbmtKOOamYj2jLjcz8Cj+FUywKxYGQ2oncMCmO/W49QOsq63
	aYmy5jNwbHRIi70O9Wm0+x1tILDkijldOa6pg/yOYcW8cFQtwmS9eXcck6SA2VmlXv8X48L1hGF
	wp4hhw/6gOStuq6NO+i538Ol44ODizhePja/5utX7iQI1KYTEAdwd5BrZiYoh39QDzPx8SiCswf
	OuP+FFW+mHXrTR6vnL+ybJQBC2vjO4xMBvScWEpDBcs0QjE38zGqW7iqgHx/rRtt3tw9D/YxkuE
	Zubf/N4rU7gaopqUaN1vUZDCcWLErqsiyDUcCK6W8RUAQuUyzDg/IN+x1EBZ3mbhGZdVJhNCLSM
	0gtlKsS7+QwgOlN1W9juO+ksg5U3gWS2Db4iqhVZCUs0YAf5RHaKIpvV1MtqzPn2zwNHgYKKtm/
	ujfyh0HuJIH3w==
X-Received: by 2002:a05:6a20:12c8:b0:3bf:99ea:aeb2 with SMTP id adf61e73a8af0-3c91b63a5fdmr1209603637.4.1785486291673;
        Fri, 31 Jul 2026 01:24:51 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963ddc3sm276125a12.7.2026.07.31.01.24.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:24:50 -0700 (PDT)
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
In-Reply-To: <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
Date: Fri, 31 Jul 2026 16:24:33 +0800
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
Message-Id: <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
 <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Hi, Miao,
>>>=20
>>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
>>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>>>=20
>>>> Previously, the driver has been introduced to support the Loongson =
2K
>>>> BMC running on the Loongson Servers, which is essential to prevent
>>>> the system from hanging when the BMC is being reset and the default
>>>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>>>> driver.
>>>>=20
>>>> Firstly, the driver tries to read and write to the connected PCI-E =
host
>>>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>>>> host controller. This assumption should be true for real products, =
but
>>>> to prevent from accidentally reading and writing to the wrong PCI-E =
host
>>>> controller, this driver should be modified to check this before
>>>> accessing the registers.
>>>>=20
>>>> Secondly, the driver uses non-exported functions to tell the vt
>>>> subsystem to redraw the screen, preventing the driver from being
>>>> compiling as a module. This can be fixed by using the exported
>>>> functions instead.
>>> You can replace the redraw function, but I don't think it is =
necessary
>>> to make the bmc driver modular.
>>>=20
>>> BMC core, IPMI and simpledrm display are usually (if not always)
>>> supposed to work as early as possible.
>>=20
>> I believe that it should be the user's decision to choose whether to
>> compile a module into the kernel or as a module and it would be =
better
>> if we can provide the possibilities for the user to choose from.
>> Additionally, I don't think these modules are supposed to work that
>> early. The mfd module provide two functions, the display and the ipmi
>> device. In the aspect of graphical display, without this module, the
>> user can still see the output during booting on their monitors, since
>> efifb is working, providing a basic display function. In the aspect =
of
>> the ipmi device, I don't think the lack of such device will influence
>> the boot of the system, since it is a common practice to compile ipmi
>> device drivers as modules on other architectures. As a result, =
neither
>> of the two functions are required to be loaded that early and it is
>> reasonable to at lease leave the choice to compile it as a module
>> to the user.
> Flexibility is not always useful, if a config doesn't provide good
> effect, then it just increases complexity and makes maintenance more
> difficult.

I should emphasize that to allow this driver to be a module, there is
no such increase on maintenance. Moreover, not all loongarch machines
are requiring this driver. Especially only a part of the server models
are quipped with this BMC. Comparing with other architectures, the
driver for BMC are normally compiled as a module, such as mgag200 for
iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
Huawei. None of these BMC drivers requiring to be compiled into the
kernel. I cannot see there is any reason keeping the driver from being
allowed to be compiled as a module. I also do not think it will bring
any significant maintenance burden. Implementing correct cleanup code
should be necessary instead of burden.

Cheers,

Miao Wang


