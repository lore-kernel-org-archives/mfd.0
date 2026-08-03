Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5068B352002
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773362; cv=none; b=TXo8OmGHE7SQPFwssWZFNdZQQt/Zxw/IFYYt5+ETQWRsltTBBSIoKZ0pAKxI4tumpx4/+mxQ51EFJPPqWxKxmXJwyIuW7Ub41XjcCRH0dwyteIrdh0J/r228ADqkAHMIlB1kYGC6DqJ4BNnl2qxsvdVsDxzGtte4gbPmwAaFCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773362; c=relaxed/simple;
	bh=/jikEh0ap5JVvxcrd8r/3UoXZQlm/E+GShUrYZzsWAo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=InKqlCEucB6kEu0+GRdQxtNjaNJUWyv++xO6R3Ilc/EpZicAmU284Ta0f+oNqGBImJhG2tBNZPDlhNv3425KRQKDnm7XjTgMuSKtldGxRGlPQ8rnK9j+hZujuELvNwfAzSYBRYLsWxGg4js6RBgIDdhmtrGNuSt9UB7aLGmExf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQx64Ydp; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQx64Ydp"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96d7933910so409712a12.0
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773360; x=1786378160; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/jikEh0ap5JVvxcrd8r/3UoXZQlm/E+GShUrYZzsWAo=;
        b=PQx64YdpxqVUGc3+xF/M4n2/0o89Upg5rg9E/hJ2F7nHzgYDtga2kawijJWuTlOHgt
         bh2ocsi3MvDG/YDKShRIDCjAxaHKeEkMTb2WZR1Kl+B0ZJVQopSxuXYU2zs2gw78dE+M
         VkQL8n2pyXKE8Q79IOY84kygqUyiPcZLFGKGXt/2y8PydYO1zNmcTYp9UuPRNSLUj7Q2
         iCywzbC+qqmnk3PjhjUZseV04nSba5ytdwWSZSaCiV4ym5zrPRf2Y+uZZhiMJvPzHkmA
         mOOyk22MA3QQ3+NEVRuXvzyTb8WU7v/KPio/EeeS9sgpzcjb2QHPZcLGK3axFKFfOQQE
         ieVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773360; x=1786378160;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jikEh0ap5JVvxcrd8r/3UoXZQlm/E+GShUrYZzsWAo=;
        b=s3z0YZABfRB7+SSJtSWsbjx5U5g/6JqnzDlHYmO8UtIXCzEmwMseR1bIvFiRacN6Hj
         Dw2KjE/kvKBVCX9TdwlWSyB2+CiObPoWxZTUVQX+KFDkSGxSnfNXyeR4yWGq/x/IHg1B
         1ehQ+ZWIXpFN+1tmeXTL55tm4vaBXq0XbmbduYytyxKDA53am0ZS/swHxYfkP19LXTRm
         Rw+pzIES1e/WUhVW5thTD8jWybkydRvvxPO9JAl9QT9MF7d5hhw1H/ho37Hr8w0BnSpA
         koQacwF5Rhe8Ux7PT4jGZ9uUt1C0T18hRPe55hpxNuzPW6YNOPtaeyv688nwVFZhenUO
         IFuQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNKD2T1shXL3yJFUlpZvXX8ReibC9gaQ+aiUO9gF7v/5k4I6ovbAMG7+q5lFPiHqKwgnc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWM61sBVWS1xw9MkQT2zMJ5R7pmKgMrQvqJ9saHgE0EQoLC1rt
	McyDYa9Sr9ypq8ekC8FNBeikkkU2FYFFP6c+0M+EDKiTj2fBctxLH3Ui
X-Gm-Gg: AR+sD11vfZzPkz73jdHFlrlsMZ+Ac6Y+Mmo5Ri13YAPSOJlSfEVtiOe+2nnE7JYmIZz
	O6eweY5txP8TrUwZCdPor7EqsSBm9KhiF9xnG7lkX+PsZniA/OxNMy0tmHpx4rP2a+eGCdHZRd3
	k+kmCGTn7pxdEa1lgZNASlY25k3lS6fY+ijV3bassU5iBguPjuej759vpg/7mhWZq9epfQMLijA
	ZcX9rzR42wdmOyIWr9552qBb01cyqXtKsTy2fxxh7ayjj3a8lJEFoQfkdy+2rlpumNKEQ+HI2cy
	LiJVHlYp+2kZ+eoiNV3BRqpp/rEYY6+zuAtBQmwL1ytz9xtf7muLHyv5KtUYR6igK9LI2nthlQD
	Kx6SM3vAWgGwovEp1aybB1/t39duPE4ijCg1TSaoSuY8WSZ8PdL41rsvLTCbdCHldqXB+nnDgK7
	j4xQPDpHN0OqRPifQQmvgPVq0Y0ydL40P888lWZMEGd8ZsmddsMc6GohqHWNCSdrlXGOod5BlkI
	zB4grkT+wU=
X-Received: by 2002:a17:90b:562e:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-38fbc4ad251mr13589275a91.2.1785773360472;
        Mon, 03 Aug 2026 09:09:20 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfdae78sm43066a91.4.2026.08.03.09.09.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2026 09:09:19 -0700 (PDT)
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
In-Reply-To: <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
Date: Tue, 4 Aug 2026 00:09:02 +0800
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
Message-Id: <94FDE4B9-CE06-4596-9965-25A70E5A2E3F@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
 <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
 <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
 <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=883=E6=97=A5 21:45=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Jul 31, 2026 at 4:24=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>>>=20
>>>> Hi,
>>>>=20
>>>>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> Hi, Miao,
>>>>>=20
>>>>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
>>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>>>>>=20
>>>>>> Previously, the driver has been introduced to support the =
Loongson 2K
>>>>>> BMC running on the Loongson Servers, which is essential to =
prevent
>>>>>> the system from hanging when the BMC is being reset and the =
default
>>>>>> efi-framebuffer is being used. However, there are some drawbacks =
in the
>>>>>> driver.
>>>>>>=20
>>>>>> Firstly, the driver tries to read and write to the connected =
PCI-E host
>>>>>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>>>>>> host controller. This assumption should be true for real =
products, but
>>>>>> to prevent from accidentally reading and writing to the wrong =
PCI-E host
>>>>>> controller, this driver should be modified to check this before
>>>>>> accessing the registers.
>>>>>>=20
>>>>>> Secondly, the driver uses non-exported functions to tell the vt
>>>>>> subsystem to redraw the screen, preventing the driver from being
>>>>>> compiling as a module. This can be fixed by using the exported
>>>>>> functions instead.
>>>>> You can replace the redraw function, but I don't think it is =
necessary
>>>>> to make the bmc driver modular.
>>>>>=20
>>>>> BMC core, IPMI and simpledrm display are usually (if not always)
>>>>> supposed to work as early as possible.
>>>>=20
>>>> I believe that it should be the user's decision to choose whether =
to
>>>> compile a module into the kernel or as a module and it would be =
better
>>>> if we can provide the possibilities for the user to choose from.
>>>> Additionally, I don't think these modules are supposed to work that
>>>> early. The mfd module provide two functions, the display and the =
ipmi
>>>> device. In the aspect of graphical display, without this module, =
the
>>>> user can still see the output during booting on their monitors, =
since
>>>> efifb is working, providing a basic display function. In the aspect =
of
>>>> the ipmi device, I don't think the lack of such device will =
influence
>>>> the boot of the system, since it is a common practice to compile =
ipmi
>>>> device drivers as modules on other architectures. As a result, =
neither
>>>> of the two functions are required to be loaded that early and it is
>>>> reasonable to at lease leave the choice to compile it as a module
>>>> to the user.
>>> Flexibility is not always useful, if a config doesn't provide good
>>> effect, then it just increases complexity and makes maintenance more
>>> difficult.
>>=20
>> I should emphasize that to allow this driver to be a module, there is
>> no such increase on maintenance. Moreover, not all loongarch machines
>> are requiring this driver. Especially only a part of the server =
models
>> are quipped with this BMC. Comparing with other architectures, the
>> driver for BMC are normally compiled as a module, such as mgag200 for
>> iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
>> Huawei. None of these BMC drivers requiring to be compiled into the
>> kernel. I cannot see there is any reason keeping the driver from =
being
>> allowed to be compiled as a module. I also do not think it will bring
>> any significant maintenance burden. Implementing correct cleanup code
>> should be necessary instead of burden.
> Can we split into two series, one fix bugs and the others make bmc =
modular?
>=20
> Otherwise I don't think we can reach a consensus in the near future.

I accept different opinions on design trade-offs. However, I don't think
you have provided enough excuses to remain this driver as built-in,
since I believe normally in kernel, most non-core drivers are all able
to be compiled as a module. I also provided some examples from devices
with similar functions. As a result, I'll not split this series before
there is indeed a strong reason against allowing this driver to be
compiled as a module or we may have a great benefit if we force this
module to be compiled built-in.

Cheers,

Miao Wang=
