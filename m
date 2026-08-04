Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECE386571
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870541; cv=none; b=fEipFfcRt/L4W8kF/oRbrRKZvVMH7cSdWxgHrv1mKtKy9db3Qjv05u5NAZxuOu3Ion9K0UTTGNGam5D2okaIyVoYwNr2A9fXXbXFFD/QyfnmG4nVglQPPbG7zgmmd7Gpy+0ARQVS6s8SgxpX2m6EQ7PsnpZzMVEWjwabAuQ1UY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870541; c=relaxed/simple;
	bh=YMxWtMXZyeRd/HYUFDtZpZrSpZBDrtrLuc4SnVs5v3g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lOT+/ubRjJvNfRV6b7yZpsYMLi0uhjQ70JZjLm4QcmDBCj93Z8sVdahzLDtEwpts+2ETbETQK1AZ4Qn8YEleEWFNZR1U7N/A5+hy7N06vmA1hg8c+utbl4LbtBoWVT7VG6esnOoz6NseRUT8Q2rXevPDM7LYepEILeVWTnO6wig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk1lTL7L; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk1lTL7L"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84eb072307dso27630b3a.2
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785870540; x=1786475340; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0woQJfmg37Twfv47ChN4B/RazTPZya8Nv66SBatWA4=;
        b=jk1lTL7LM3K/22n+ZtV3XY9uNdhIY2hKsz2YGzAwcCALIiz/tET3HvvVmLtyRHHMwy
         CYtqyxORxXqT+rI+fDm7HLaUqt7b9gRPgHbfH87GSq1r7etLLgoUK2eMXGrE5yQhtzHb
         g+tW0G2t1giv+/Ve/32unJ4cVMLGnfgU0zckxAnBQfaw/OvMQVBA+7Ou0tNVJtXy0Ngh
         ot0JDG7FMhxWbKOo6O+WYP4rA9uJi4t9ztsJ7XhMtEPXeVkb7G0fpMw4XRPyciuYQ4Xd
         fKAviMty1BEHii1sBBTdOlUVHe+nunZLcBRZ5H2sHXm/D3oTG/Wr1tPGUPIeCu8KBvgQ
         ndvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785870540; x=1786475340;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0woQJfmg37Twfv47ChN4B/RazTPZya8Nv66SBatWA4=;
        b=q5sR7a/UuNzHoMNuHetmBljZWtYMnZr2zuzfLuQR4zaBK1hjFoTeGb1RYFjlDR+YPs
         +dZnGLy/HXZ87hexuIaPqybV3kSb/RnsbHK/77uxRF/QrND7IUly/gYqo015xCw4uYXh
         htPzsfWkOgyFWGfHVJsBnr3rSrgVBuZwH+X2NO6yg6zCe8OMThZ+/Nw8iz7xaaGp9gQI
         l4D+t6xxp2dyEViIiNetsVaGtFgVZdDC9rxW0UO4afbI/hx7DRp2KmFcyEKE2O9uT5U3
         wjB661fCh68CBwwlcJQULbpjqVUrkTRozMcG3Xo++fSBt57JTY9AVKZT6t8fsCza+rBn
         66xA==
X-Forwarded-Encrypted: i=1; AHgh+Rr44NYSWgyO9s9TBa8ipFzG0H1WAg93wcIQL8s1igrGVNTeAQVmAN2nc3W0fkPFlBZrvFQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyztNsDQu87Gtv1KvdEaYQ8ZPWNtZf2zDRL8LbfCB8FaZZVZeWf
	ulSfe0c7gcUENc3zMH9RgsOWbfrTrftTkH3RTxwAg9xiBNhlVyMsafaK
X-Gm-Gg: AR+sD11tLilL74JFaWIWV6yE15tm7spHJwmLmM0T7om79lhGGzDh8/Ga2+kh4ikiU6V
	pE5tPHXYx4NdcEgRYeMIYyTm+4yzE7EplNYjdRzFHY/vDOcLL25pB+odjcxypKwD5afHrvQMylD
	I+83sVMKBfNth6Qc+OnWsXS37vd9gU3Vd0lXoVky//I8hlhO6boHve2/a+1LGm7pBJAwnxmGaEA
	W+61Up9FRR3ONYASwH2KOqeuHVqhFv8I+dutSuOtKBhlag70JIDOdWNaAqQgV2tMAlP90GOSwb6
	2NKY5tnNV3r5lK8fJYOHTXxfit76sqCInDMSuoy8shE7FDKFUewElDl7A+j9t4gSs/56HukmTvK
	nGk+Qo+QXaXXRh6NSnbqnYnI3xCdAoBS5ssUtNzOY3C0wNHZ07TvgSv0oYVtjy5XOS/K33CsK+Y
	Z4uxKCkSR8okSzr04T0Na4PV1nUNcTJNnLA8Iy9Sbc2au7eH1kfliSAoSV+bUZNwBX2QVLNwa+U
	wSms/efeJI=
X-Received: by 2002:a05:6a20:914f:b0:38b:d93f:bbf5 with SMTP id adf61e73a8af0-3cb85bc6bf7mr1016979637.0.1785870539436;
        Tue, 04 Aug 2026 12:08:59 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708e64b6sm161155a12.24.2026.08.04.12.08.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 12:08:58 -0700 (PDT)
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
In-Reply-To: <CAAhV-H5VhwHyBtaf8uXDxiq-6-CyvC1PNsrjL3hwZ+uVuF33cg@mail.gmail.com>
Date: Wed, 5 Aug 2026 03:08:38 +0800
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
Message-Id: <B740826F-51D2-4BAA-960B-CE4D320E2E44@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
 <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
 <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
 <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
 <94FDE4B9-CE06-4596-9965-25A70E5A2E3F@gmail.com>
 <CAAhV-H5VhwHyBtaf8uXDxiq-6-CyvC1PNsrjL3hwZ+uVuF33cg@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi, Huacai

> 2026=E5=B9=B48=E6=9C=884=E6=97=A5 22:33=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Aug 4, 2026 at 12:09=E2=80=AFAM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B48=E6=9C=883=E6=97=A5 21:45=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Fri, Jul 31, 2026 at 4:24=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>>>=20
>>>> Hi,
>>>>=20
>>>>> 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>>>>>=20
>>>>>> Hi,
>>>>>>=20
>>>>>>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>>>=20
>>>>>>> Hi, Miao,
>>>>>>>=20
>>>>>>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
>>>>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>>>>>>>=20
>>>>>>>> Previously, the driver has been introduced to support the =
Loongson 2K
>>>>>>>> BMC running on the Loongson Servers, which is essential to =
prevent
>>>>>>>> the system from hanging when the BMC is being reset and the =
default
>>>>>>>> efi-framebuffer is being used. However, there are some =
drawbacks in the
>>>>>>>> driver.
>>>>>>>>=20
>>>>>>>> Firstly, the driver tries to read and write to the connected =
PCI-E host
>>>>>>>> controller registers, assuming that the BMC is connected to =
LS7A PCI-E
>>>>>>>> host controller. This assumption should be true for real =
products, but
>>>>>>>> to prevent from accidentally reading and writing to the wrong =
PCI-E host
>>>>>>>> controller, this driver should be modified to check this before
>>>>>>>> accessing the registers.
>>>>>>>>=20
>>>>>>>> Secondly, the driver uses non-exported functions to tell the vt
>>>>>>>> subsystem to redraw the screen, preventing the driver from =
being
>>>>>>>> compiling as a module. This can be fixed by using the exported
>>>>>>>> functions instead.
>>>>>>> You can replace the redraw function, but I don't think it is =
necessary
>>>>>>> to make the bmc driver modular.
>>>>>>>=20
>>>>>>> BMC core, IPMI and simpledrm display are usually (if not always)
>>>>>>> supposed to work as early as possible.
>>>>>>=20
>>>>>> I believe that it should be the user's decision to choose whether =
to
>>>>>> compile a module into the kernel or as a module and it would be =
better
>>>>>> if we can provide the possibilities for the user to choose from.
>>>>>> Additionally, I don't think these modules are supposed to work =
that
>>>>>> early. The mfd module provide two functions, the display and the =
ipmi
>>>>>> device. In the aspect of graphical display, without this module, =
the
>>>>>> user can still see the output during booting on their monitors, =
since
>>>>>> efifb is working, providing a basic display function. In the =
aspect of
>>>>>> the ipmi device, I don't think the lack of such device will =
influence
>>>>>> the boot of the system, since it is a common practice to compile =
ipmi
>>>>>> device drivers as modules on other architectures. As a result, =
neither
>>>>>> of the two functions are required to be loaded that early and it =
is
>>>>>> reasonable to at lease leave the choice to compile it as a module
>>>>>> to the user.
>>>>> Flexibility is not always useful, if a config doesn't provide good
>>>>> effect, then it just increases complexity and makes maintenance =
more
>>>>> difficult.
>>>>=20
>>>> I should emphasize that to allow this driver to be a module, there =
is
>>>> no such increase on maintenance. Moreover, not all loongarch =
machines
>>>> are requiring this driver. Especially only a part of the server =
models
>>>> are quipped with this BMC. Comparing with other architectures, the
>>>> driver for BMC are normally compiled as a module, such as mgag200 =
for
>>>> iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
>>>> Huawei. None of these BMC drivers requiring to be compiled into the
>>>> kernel. I cannot see there is any reason keeping the driver from =
being
>>>> allowed to be compiled as a module. I also do not think it will =
bring
>>>> any significant maintenance burden. Implementing correct cleanup =
code
>>>> should be necessary instead of burden.
>>> Can we split into two series, one fix bugs and the others make bmc =
modular?
>>>=20
>>> Otherwise I don't think we can reach a consensus in the near future.
>>=20
>> I accept different opinions on design trade-offs. However, I don't =
think
>> you have provided enough excuses to remain this driver as built-in,
>> since I believe normally in kernel, most non-core drivers are all =
able
>> to be compiled as a module. I also provided some examples from =
devices
>> with similar functions. As a result, I'll not split this series =
before
>> there is indeed a strong reason against allowing this driver to be
>> compiled as a module or we may have a great benefit if we force this
>> module to be compiled built-in.
> At least you should remove the first patch from this series. Binbin
> Zhou has been fixing it:
> =
https://lore.kernel.org/loongarch/20260616115530.4012675-1-zhoubinbin@loon=
gson.cn/
> =
https://lore.kernel.org/loongarch/20260624085550.1508771-1-zhoubinbin@loon=
gson.cn/
> =
https://lore.kernel.org/loongarch/20260706021909.2346535-1-zhoubinbin@loon=
gson.cn/


Sorry for not noticing Binbin's patch which had already been addressing =
the
same issue. However, I believe the fix in my series has covered more =
issues
than Binbin's patch and thus should be better in the following aspects:

1. Since the length of the resolution string is short enough, there is =
no
   need to allocate buffer from the heap. The buffer can be allocated=20
   directly on the stack. The most possible resolution string might be
   "video=3D4294967295x4294967295-4294967295@4294967295M\0", which is 51 =
bytes,
   and allocating 64 bytes on the stack would be enough.
2. My patch enhances the validation of the mode string. strsep(&ptr, =
sep) may
   set ptr to NULL if sep is not found, which will cause later strsep()
   invocations returning NULL, which is not expected by kstrtoxx() =
functions.
3. My patch further guards string manipulation functions by adding the =
ending
   '\0' to the end of the string buffer, to prevent strsep() from =
overrunning
   the end of the buffer.
4. My patch also addresses the type of the data. The fields in the =
struct
   simplefb_platform_data are unsigned and thus kstrtouint() should be =
used
   instead.
=20
If the BMC device is under the control of an attacker somehow and the =
attacker
is feeding malicious resolution string to the host kernel, then the =
second and
the third issue will cause memory issues in the host kernel, which might =
be
dangerous.

I wonder if Binbin is willing to address previous issues in that patch. =
If
Binbin is willing to do so, then I will be pleased to drop the first =
patch
from my series. If Binbin agrees, that patch can also be absorbed and =
replaced
by the first patch in my series.

Cheers,

Miao Wang


