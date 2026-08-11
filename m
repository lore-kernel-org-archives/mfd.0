Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D9448BB6
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457552; cv=none; b=lp26HIxB87YTNy4WHlmLdAIY4RWPMWY9lUR0nNw7VOl9Kw5WfMLGHIG2ceaePtPsCvN0MOLVtJXb6Lu6tLvlQe7NDHhBhEtL07Y/+Jes6fCJUaZHK0oP2kADD6Di0P5IQhlUgSHxeLfpoME5JjHvK1liHtK7cqwNne8pt6hWSMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457552; c=relaxed/simple;
	bh=1k3JViH6fAUiAFXFgQcs5bAOpgubp2YCdUyHYnM2jew=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=reFFc6Tqys1KmPoIQPtCIOyrtKzqJJsPdGzxo4TXlVPwzjKsf+SvLNcXwj0XjZ2RzIu3v05ckYiHiEoWxeED8sKbXkb7qG+X0FV6wM+gHlClNqQxEtQdAaNyy+C4kszOPyjYvOKTEleu7w0Y5x88wqsHm5afT3sca3Rk1D1TWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6McCfWK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6McCfWK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbe4c537ad6so240863a12.0
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786457543; x=1787062343; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1k3JViH6fAUiAFXFgQcs5bAOpgubp2YCdUyHYnM2jew=;
        b=Y6McCfWK/y4JrVdowOQ8H4DSUiTSDL0RaC0Nszalljp7rQsjLE5isDT2iHuIcWM9Xr
         zlt6NHP7pfXrEAFtGRO699UY/BjOYdUv0rTN+vB0fUh46FhDPhtqM/1wZHvBMkHV/29f
         91V/W5dBQXOSFM2tDAXIjUpXOhIqrBnctKQ3oWx1jEsfBjxf6ieUaiCkL15pjW98rQfa
         NEyTg9E5BbMVeRcZcUpMiLrIgjv8qiG9MlWIgESq9dZyt9GKKPqSeasvDM3WbSbCgdQ0
         j/W/qkZNA0ECXqZXvLDAw7tAzaSFV4MqggUeHneELBAT1LVO8kmsKAQFp8xz30A92Rk0
         VUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457543; x=1787062343;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k3JViH6fAUiAFXFgQcs5bAOpgubp2YCdUyHYnM2jew=;
        b=lE8H1y0etmGn+UQ1jsw4tJj0RUpzJe6Za6VTte2S8KS16Mv88jqxkd8+4prdlmiYAK
         RpDg+vUIjbVSZoFpbQ2zb5DzC6Wb9KwLdHQiMTJ9A1YMipKsF7rxn8IfxgFOAl4RkYWb
         GvsULyl/hWmNuA5FbOi6X9yNThxYKbUDmCaZ9MX1mt+JGczlN/wICguE2sBsjZ/WaOSD
         yAOdefXxBaw1qTRwPyb3XD1joxI5KKW2QcBStK6TVD6DbgrGOJA+rgdR10i715gzhhOT
         34g669lO9c2lPp93Ur7pdmGkF59OVe0JgNj18GgF0dfnAIXNLSHEGNXwunJEriIrdYUS
         Pgbw==
X-Forwarded-Encrypted: i=1; AHgh+RrnOqXht0f3vHotkO6xAEVQ+45B7U3DvqoilfOPCSKWL08vrtrKX3ONj0LlWDn1NQIfo08=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2/mPuBHnm5ChRAoUT0CT63IllYDUo7upvpN4oorCAd6K2axhY
	SQgQ30LThtYgJkZ2710465FZr+9zKvxU9rPTaKBozmyzpkpiDVnvoZF/
X-Gm-Gg: AR+sD13wjW0B7PW5sCUalriw2iRZNCzw1bySEzDSaTxcC20xLd80jAEY7MNefWX3Isv
	778mGqZ7cfsZEzAG+sF42xLCcR/S1ixZUBduXecG8KLi3QSJ7w8LjEWKupQTfZVqDsnLPbGgDE1
	EvAXAvWb6oqYaG02DD0d+qGagidwD5TxninEcpyS5E+Lm6YcrUZWXCami0i92x2mPsOBFsTfnK1
	5roWyTR6naMK83WtdZML1dzLYaIyYbrOKw4xgONrbuZpDxVU6xmE0HC+iIRDhu26pDBmIxPAlX1
	jtcJlClUZDXv35+HzM2bb/EWeNj1qBhAdj8mwr7J3bCcYqpyxoPxjnuDUBEU8kXYOf5iJi8u6mZ
	RkpHnHrsudYjQZVZWSKMeoYm4nXQwMn0Zal5Wpts5MlLEluzINyDvxXBcB5j6x9b3OdDR/FgGe4
	UqYqR1oRmxEWUHqM9fOKepB+zaUTLp37oQur0e0sikSD5JhyKxmbvShHO87lou4rCHwiAjYnXDT
	ZtCGZidpRc=
X-Received: by 2002:a17:90b:2d81:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-392ec6eeea4mr2830864a91.1.1786457543223;
        Tue, 11 Aug 2026 07:12:23 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5195a4dsm4310683a91.4.2026.08.11.07.12.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:12:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
Date: Tue, 11 Aug 2026 22:12:04 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Corey Minyard <cminyard@mvista.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E22A87D6-F231-442F-83F5-FAE25D0955A2@gmail.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
 <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=8811=E6=97=A5 21:47=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 11 Aug 2026 10:07:24 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>> Previously, the driver has been introduced to support the Loongson 2K
>> BMC running on the Loongson Servers, which is essential to prevent
>> the system from hanging when the BMC is being reset and the default
>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>> driver.
>>=20
>=20
> I will stop reviewing this series now. I had further comments that I =
wanted
> to post after reviewing patch 6/8 but got carried away. When I came =
back to it,
> there's another iteration already on the list. This is not the way to =
do kernel
> development. Please *don't* send new iterations hourly or daily. Once =
a week is
> preferable, twice a week in special cases is acceptable. Anything over =
that and
> I'm losing interest.

I apologize for interrupting your review. I thought you had done the =
review and
given the suggestions. The only change in v9 is adding the comments =
which you
had requested in the previous review.

Cheers,

Miao Wang=
