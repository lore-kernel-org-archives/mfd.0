Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1BB47CC65
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808182; cv=none; b=q4cSngm3SgFbG0G6Umo6wZ2KKzPumlvUtvUEo+xTzq9qNPPzckC/IeH+PYpdj1gw2QWYz/cZ/LXKrMhUYcJs+bUPVJ8BMHowpSQdHKQI0QZV02mzyh884KaJKMHXEING8VJbPw/A2HD9kSmi6WX/frynH2PVGbK2g0u73Zow5M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808182; c=relaxed/simple;
	bh=/yhp5ZbkLbJthZksMO1yEszY34ESiGOVA7ZCE8Rzv7c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ISOGg6J/2qr7RUibUDRQZsQE0VzFvB9astwtCovFGAbvn9QA02ZyNgiW96m9tXgUsXrUvYIcgnjVbFWDcMgfUmP3AL44O1pk6hhPiZkZUU8lzlCzXjfx51qZcz0RdZepPi+JbTmzXlYfnpbN0KMrSvJ4D0Eu3KU6LfszHKhx0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPrLVbxx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPrLVbxx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384422b05b5so103680a91.2
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784808170; x=1785412970; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NlQ8sj58KxG698DZbC9agL7PD8YxaQQR/BTtnhcQD8=;
        b=jPrLVbxxYxlnEIzpMTaD3tRi5l9wiqXH2jtL5UWBalLn4lH3zOunc/cO3YREfHmVhd
         gIxOqkgpBpK8uQvOQD+yfoSLbo4yngDcBjdodt9QTXggtdsrkDalNGiNEt8B2DZ9p8yO
         X3xHpJzKdFt1iXFRJBAevFVeLr0qdGevyl4jL5LxFumDycKKr4NYplw4DOYu8mGh6feW
         ChLnM8vVHgJHfjfQfmbVeEckaVNKHqXvmsksPiTld/okcTIraIJzog/mLQGmP6QnLsnx
         sy5g5S0MJ2uVkM9O1iDb2brrsTuXYYEWusF2WSfiHoVKizEtn7JSRCJM3/whNOXPjPTu
         cOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808170; x=1785412970;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NlQ8sj58KxG698DZbC9agL7PD8YxaQQR/BTtnhcQD8=;
        b=FY6DLkfJG6gR9Mv93S6QStuv87HT3kdTPYkBtMCe7ZysMA0AKPpdNT5MFW/ATuKNGf
         hrSOL+UtmbYrKe9KRk2NuqIx/ITeSk9ackOrQydQbKteQu47RWI1sgDBNizNyFsZn5o6
         GlDRizM2+Uwb+zDjD1vVygGjLnezSAeIQPzbwlnpZx4S4g6eSRb4Ar7olPcvQOOLYRvc
         1ZXWc7DCAlxEmzUKDD2+p+XxT27ffd7EtqhHoPb+QKCRq+WLAdfmebgOlCE7Zrq1ushC
         pFuJtpSVo6uUnndf8AhiTFusl3O/YFDXb8T4a4bP5ml7OEiIGjooVLSMcQ162j6y4p5C
         lzsg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5SGUkQDDlJgV5mJ2dTEQMHJkIaTwjiNk2ALZiAQXLDwetdv4wCLVs+K2J23bb+biSxhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZEe+cG3JM4jy52NNFFwgYOWHl/ky9mYREzozRZW/JMuzFhxTs
	mFHwj6kSjizuRvEXn8CSaQNI4NE82PqZN099QlA7dBJjkkO94JlrBTsC
X-Gm-Gg: AR+sD11g3RXe0kgkEKiT+5xZTkmj/Gzaw/T0W2y8qoehKTS0fylxOcAR5zAGMxx1cDA
	Qp3F3b/YZJt9yym/LQONLVZSCRfY9joI8PqVhS7XTX6f5HLhY5S+VzrlujR5rvwfDyWSYDdQh75
	YH5rohbrG5CKR2Bi5QtIKc/dIgn41GzipZc5YKPYo7UMHYA4HF7qoHaRWQ/1ezp+INNjR02etcc
	XHCsYBnGS9WfZpGce8OKxeWaONIcXcUBZ0B6Fg+H44yEr1SRKvNn0VceUpnmZNCoyTKmpD6fOkT
	r+EItmdnsVJ5+nI5ppWff+0yNFTOZETqtgt7dRmCw2ns8yvjw/tzKx1E+XL7Tn86TahrDKFe3/i
	IItqgqChFkRsmu3nQ1oRjYh9Ve+OKcfwiAcYinOTsSkqOVzLIU6GmduyxutuHwn9eQRMizYTUYq
	QzpAZnEP1i4PdHdCRqaR2MhsqU
X-Received: by 2002:a17:90b:1d4f:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-38ec6466f4emr2198352a91.1.1784808169393;
        Thu, 23 Jul 2026 05:02:49 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1c3393sm2608783a12.32.2026.07.23.05.02.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:02:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <20260723112940.GC3363113@google.com>
Date: Thu, 23 Jul 2026 20:02:30 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
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
Message-Id: <034E7CC0-47AA-40A3-BCB8-B9BEA2190DCA@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
 <20260723112940.GC3363113@google.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 19:29=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Why is this v3 set still RFC?  What comment are you requesting?

The reason why this is still in RFC is that I am still waiting
for response and discussion from Loongson personals on the
proposal that adding a DSDT entry for the ls2kbmc device that
describes the GPIO pin associated with the device to signal
the reset event of that BMC device. As pointed by Ruoyao,
such a proposal will need to be discussed with Loongson. I have
CC-ed the patch to the relevant maintainers from Loongson but
failed to receive any response.

Moreover, I am also in need of comments on the backup method
of searching the GPIO device and pin when such a DSDT entry
is not available.

Cheers,

Miao Wang=
