Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778463DC4DE
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372135; cv=none; b=G7FjRJ6JAp5E48lzfOW4hKZsizN3LXO20qjI/fJ1kNELMQzhelW7OMB4LmFay9L+03ixrrscw/HBxNm60dmqrpKxbcYu8bJQY9za7gqlwpl3H37TIl0WDgzeoA/yiBH8sVlwXW7vdzMQL0ZM124JC5rtY7OBSEob8JCMd2AdS40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372135; c=relaxed/simple;
	bh=FM1Yhn5pr3pRaGSn1FE1Z8TC8cgGm1mn/uHg6h+6Xg8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRPHrzpMjDAAqv7npymgWZmYgvv8kGIX7+fDgPM9hkL16/48HdxQF7EyqMbk3W5T1/zzu8Npnu2nzlSkIG963UEvsUCde1vAHPjuP3dorNO6mQmMtd1CUUogfgKh9AcC98tKwW0CxTUt3ys0KleRJp5lxPp57j4WPaTuL+Gy6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4t/rsIz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4t/rsIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88AB1F00ACA
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372131;
	bh=AU9hgVa9d3lJZNdKDc3+30A300PYpelbFyDkHeZWtgA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=X4t/rsIz+ZcsX4wJC7lHa18d2EGLrjYJ4q0eUDp2s9eK0iUTCuChlo4Zc6YDQ/9+k
	 qHcTzR96k7KKEkfu4ezkouTBnZ76M2pvDyA8AGmz67xCo+ZOUm/1WBq+9VFgH/MyqL
	 y/MOycSt3Ms5id0TrnYE4VLP4SZO2jR21E//Coo7RnpKuxCR/5TE+T6E/5vV1z22kM
	 rC+Jbqx34wOlHOV8Wbv+AbKYgbiwXEeWrESuOWLR/o1NQmklOn4MJ16nvoFb099hkQ
	 RxCna76NkQw5soB3IavGS5SwOBV517mxwr7aKyDK++mxnA27eVB1tCFIuFWdBkFGam
	 OcIyn/rRHK1SA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b021916bd3so2281710e87.3
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 07:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr/N0iIxJEDLVyINAjdkbZcAuSBuYo5HNpcJSElc+ukA4DIQuDyDFG7oL26+WCknYV6YfE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZSMyt6vw8xr/h1kg/UXgedRToP3XfrE3QgvT0mExfyJkA/gA9
	Elon7nPGGZfQLOPMNByXvMzApHQ9uu5aDkECRk5MFxPHPyTCXDUj8V1WA/Eq5svXRIZVKTBmU4e
	b4I6EnKm7BFbMR3IjIID6iyK4oP0ybwT0/VMBd/Pydg==
X-Received: by 2002:ac2:4c1a:0:b0:5b0:1c19:2cf4 with SMTP id
 2adb3069b0e04-5b30b770fe2mr1987708e87.35.1786372130466; Mon, 10 Aug 2026
 07:28:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:28:48 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:28:48 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <84622E1C-DF59-43C1-A92E-478499AEEBCB@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <CAMRc=Mfo4J8n9MWOzUBRz-VRu7T6SNLTTGrnWfHxGfWxZz71Sg@mail.gmail.com> <84622E1C-DF59-43C1-A92E-478499AEEBCB@gmail.com>
Date: Mon, 10 Aug 2026 14:28:48 +0000
X-Gmail-Original-Message-ID: <CAMRc=McF706Vkzrvt-aTz-4gKbXj3nOi41aTqH1Sp0=Z9nVgtA@mail.gmail.com>
X-Gm-Features: AUfX_mwzj3JEzdDUgf_TOJsCJ_PFHuAfeh3hZ1YBHGtWdIviOFIrC213zsID224
Message-ID: <CAMRc=McF706Vkzrvt-aTz-4gKbXj3nOi41aTqH1Sp0=Z9nVgtA@mail.gmail.com>
Subject: Re: [PATCH RFC v8 0/8] mfd: ls2kbmc: multiple fixes for this driver
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, Xi Ruoyao <xry111@xry111.site>, 
	WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Corey Minyard <cminyard@mvista.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Aug 2026 15:20:47 +0200, Miao Wang <shankerwangmiao@gmail.com> s=
aid:
> Hi,
>
>> 2026=E5=B9=B48=E6=9C=8810=E6=97=A5 21:08=EF=BC=8CBartosz Golaszewski <br=
gl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Mon, Aug 10, 2026 at 3:04=E2=80=AFPM Miao Wang via B4 Relay
>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>>
>>> ---
>>> Changes in v8:
>>> - Address issues found by the Sashiko AI review bot
>>>  - Fix the error path of the probe function, preventing unintentionally
>>>    returning 0 on failure
>>>  - Reorder the patches in the series to make the change to the Kconfig
>>>    entry for ls2kbmc to be the last patch, to satisfy the AI bot's
>>>    concern on failure to clean up when the driver is built as a module
>>>    and is being removed.
>>> - Link to v7: https://lore.kernel.org/r/20260810-ls2kbmc-mod-v7-0-8aa0f=
b5a5462@gmail.com
>>>
>>
>> Don't send several versions of the same big series within minutes of
>> each other. Give reviewers time to respond.
>
> Sorry for bothering the maintainers. A reviewer previously required
> a clean or justified Sashiko pass first before reviewing and thus I
> have to fix the high issues found by the bot. I would be nice if I
> can privately send patches to the bot and let it review before I
> send it publicly, to reduce the disturbance to other maintainers.
> I tried to run that bot locally but failed because the bot was
> consuming too many tokens before generating a final result.
>

That doesn't change anything. Sashiko commented on v7 which also contained
changes requested by me. You should wait until I respond before resending t=
he
series with sashiko issues fixed because I may possibly have more comments =
too.

Bart
