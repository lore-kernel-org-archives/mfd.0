Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742E449B0A
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456039; cv=none; b=E6CeggAYI48hXfThVW9b9RhLk+H8LCzULlvELOdwFXWe/6hA+rt2wCM7gMqQfC2EEdhdZ0bQdzCinQtrb3dL+czsmEgf/qI1JJypD1m4ZFCZPchStUvVQSqJ3Stlr5307mdW1/5yeNmZbA3+1H2xDd1sW/HQi2PSkWulbqUVxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456039; c=relaxed/simple;
	bh=l3JvNP94U9rWRhctm1gEpi5KtWE+SQyWD6h2KDNHsqM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uA6fSFePIc6y/P2HwmxrPFiz8wSTY4hxLVstZxb2om+ENxMXxgqJcfcPvUhHUCwwVZ4jWqYpwUy5Suj/hUOMP/bfeEyGwP3BuQJpacg4AUnh8hVgKX0iESGbAc5Mxug0EMkZwKD1Ldt5UlB1MGmdobjnuLs7txN/YmAi2jlMaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzUFcvPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzUFcvPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960DB1F00ADE
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456033;
	bh=l3JvNP94U9rWRhctm1gEpi5KtWE+SQyWD6h2KDNHsqM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bzUFcvPcB0Dt0w2Se7KjQyT1/koMFtr+jUs5A3NGFI0Grj04qHtqdB+FIDx9Lsed+
	 e8urTQ1vTgaL87olOSQSh+FQXm82AJPRtU59tWG39OmyODeIVpLMuz9LPqaYnda5FJ
	 wBCeDfB/VsVRxZSCghYNFQMj9bpF4mpKq6O1jlllR2vaqV8p34x1iTMZla6/oLuUVp
	 hdg0I+2oxc09ZiZDf7wKoqPaVT3vT+nD/CvQK929mLC3JkcbR5NLAPDqk9S7G0dJd3
	 iarqAdWzzu1nZbtSf3lpzCZmHrRWHM4M+2MLZRjZiLkTXl7SIwPGKeX/Scj5aBHJmF
	 ub2ZCV/RnC4KQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3570747e87.2
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 06:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoyneOcoWTEkTsQ0XxPUHMESkBVvrE6TsRc4Xj82Cp4BScP7BEAPXmGuubFshpRUP6kbnw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw11fEeulJRE/rklynG9gglJj212Sm47Qnkn5xOpmxzjFQilih1
	7rZqjDHOUke5KoOntQCCbUWOgCrJ9E+oMYpLU/ASYsYan5HnDaDy0/0BxmAY1UBsjaP5Kg5CanP
	O6S2OIhonarH4I8b8h2qd0w28iP5PxZuYZB1qlwci8g==
X-Received: by 2002:a05:6512:3093:b0:5ae:c43a:c18e with SMTP id
 2adb3069b0e04-5b448609d12mr553287e87.23.1786456032316; Tue, 11 Aug 2026
 06:47:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 06:47:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 06:47:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
Date: Tue, 11 Aug 2026 06:47:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
X-Gm-Features: AUfX_my2SCMJ0OgPHN9VbFK3hgjd3U8mRIo2N82GmR1diN1vs66ao62LN3MaFhI
Message-ID: <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
To: shankerwangmiao@gmail.com
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Corey Minyard <cminyard@mvista.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 10:07:24 +0200, Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> said:
> Previously, the driver has been introduced to support the Loongson 2K
> BMC running on the Loongson Servers, which is essential to prevent
> the system from hanging when the BMC is being reset and the default
> efi-framebuffer is being used. However, there are some drawbacks in the
> driver.
>

I will stop reviewing this series now. I had further comments that I wanted
to post after reviewing patch 6/8 but got carried away. When I came back to it,
there's another iteration already on the list. This is not the way to do kernel
development. Please *don't* send new iterations hourly or daily. Once a week is
preferable, twice a week in special cases is acceptable. Anything over that and
I'm losing interest.

Bartosz
