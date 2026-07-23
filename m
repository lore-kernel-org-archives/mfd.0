Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361847F2C4
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808892; cv=none; b=nwiXllahCiDNnqCF/Soh8dCx6jyCZhVynqUCSapNxny2vzJG/mVe+zMIA5ku5E9aYE5eBVJ4Ea1uqBG9Leb895eULNoO7S/JF3jr4ztILi0+1kPJLp2sao+6tHt0ou9UUZJJg5Y8G1mxYlPzYO4xEz47/NyfhLr/ipPhJWDqUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808892; c=relaxed/simple;
	bh=nQIK2qNRpQnnO3WE7Zx/GRD1UTj61auqsOK6uG/5LU4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tYXAI44HgDQTnHpIZ9vbXNHmKMguo6YdKiCUyacvJ/LXgC2fD1KTeywzT7grlReRXNzLSbN9JKbfbGpGpTGVhRFT79qWKw78ZtR7Et8xnN3GObLvgE7N2vAJHA3rGg64L0j0cPMn9VTxm2+jXaVSt3DTHke6neyIIkIJ1owU1s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSKAMhfz; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSKAMhfz"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so97662a91.0
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784808887; x=1785413687; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rjYZGhFW3MVSYAcsvmcUSA6zBH26wWwBRnEVd1MS60I=;
        b=JSKAMhfzvYD8tpoxMYyGQlRG0/efIVtS1XGbyoHvpJNX/9g0i7dQyxj+fAUb3gVmYi
         Ve3K3Pk5hJwPzfb5+axdTbjwn8fjiVKhSbfWLuhxCwebWVW1yB8BMlkm0X672W+KFRdI
         7xxVM7Kg6Xn8rO4MVWg1Ny6j7sWlSkyTugdhCnkxQVeJRyH3zPKlohCPZRN6IFwkmLa1
         U6pW08b763Qct/sfzp1m/nSkS64cxLWYk/oeNN2FOG94rnk31rF/mCR8HLfqW8vhqZMg
         +onpGZuOVkw9wZ5mo821iiYBOexpThy6U/4qol2RAahLC5VdLH9m4e1ybIXtnPH70EN6
         dcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808887; x=1785413687;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjYZGhFW3MVSYAcsvmcUSA6zBH26wWwBRnEVd1MS60I=;
        b=mu/FiCKh60OS9ADsAcD0q4Yi5PLGHu0b2FPmuuIrVPC5dDJXNOGMzNKkcGYSyDFeiW
         /RQIFGmcCDF13vh8D2jrw1RtQStiFYzFD9jjxf/cMRh7AZloPgt1l+knhdG4yXjGkY8c
         iDmCYQFenNCaNFPk59c4zaN/Hd4AZq821Ouk6EB2XGaCUUIdoVPWbh6QluTenneLHZ47
         RTilKGi7O/a4c/+5TFiI/akpAGHKDwKjzffd2Lg48bTJC7S7lR8EZ5wlUuQVgrWk+DBI
         c/aOSJle2Jq66tTxsJ25AMQRIPLgz3CgZEgUVOAxI3mFY+iNMw3FePMujBP5NILk7Bho
         xSrA==
X-Forwarded-Encrypted: i=1; AHgh+RroiCQ5/jkv9x51XLE5CDdcoavQqllVwXb30LtiFuk8MLCjoQGf+XKdXr4BtrBjpxwE7YU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbuqV137VdypKdqQDTZ6Jm5iSUOG4a+v8lV0RzUqltvS+arM4a
	QTkJ7yjmesqRLjCobNmACvo5cYkmiApCSjWCvg15flynwTglBQMW9G3y
X-Gm-Gg: AR+sD112jhB65df6T0fa92WFJPARQcqmcViIytoGcXeuItevDNDXC0hpRRL0i1nKr5c
	BLDwSpsLWuXzRg/W8FaBL/yXFIMlNmTLlhn9cABHR+m7BJ6z1YLy7yGu64xr/e++nsj5p9Kby4n
	dUBMi6bLjXwzA1FyXc+Mn7hWw3Lq93ZXARE/xp5Us/oyQjlrsheLWlM9Wss6w4mH3JmaQtv/R/r
	RHfD0f5Nr7+eM/mD74pFX+2bb5o0prOGRFOb0jWnEyB8JVOu6bN/WsBV2nOfGaUusTgSYwfKmFj
	e8U1xXLVlfsRccsiL46jVPmzx5zK1MFm6ZN8jCpX4wCvOSDkgqIBpzyy0Nm/ErgGjy3ipdOlFXh
	DKlootvtGJ4HxeJjXKRDTfNpP6P6STWMr+dJTD4pKe/3GDXr5yaMT2HCD3/QG60hcM39+ImeqZW
	0GswaoHKraQ/RWs7ewvTHlmFZl
X-Received: by 2002:a17:90b:264c:b0:38e:6d16:1439 with SMTP id 98e67ed59e1d1-38ec6624e75mr1992911a91.5.1784808887285;
        Thu, 23 Jul 2026 05:14:47 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ecab80f0asm916062a91.7.2026.07.23.05.14.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:14:45 -0700 (PDT)
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
In-Reply-To: <034E7CC0-47AA-40A3-BCB8-B9BEA2190DCA@gmail.com>
Date: Thu, 23 Jul 2026 20:14:28 +0800
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
Message-Id: <2FF2A15C-6170-49A3-9E9F-F5CAAEC67AE4@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
 <20260723112940.GC3363113@google.com>
 <034E7CC0-47AA-40A3-BCB8-B9BEA2190DCA@gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)



> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 20:02=EF=BC=8CMiao Wang =
<shankerwangmiao@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi,
>=20
>> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 19:29=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> Why is this v3 set still RFC?  What comment are you requesting?
>=20
> The reason why this is still in RFC is that I am still waiting
> for response and discussion from Loongson personals on the
> proposal that adding a DSDT entry for the ls2kbmc device that
> describes the GPIO pin associated with the device to signal
> the reset event of that BMC device. As pointed by Ruoyao,
> such a proposal will need to be discussed with Loongson. I have
> CC-ed the patch to the relevant maintainers from Loongson but
> failed to receive any response.
>=20
> Moreover, I am also in need of comments on the backup method
> of searching the GPIO device and pin when such a DSDT entry
> is not available.
>=20

To complement, the part that I'm in need of comments is the
7-th patch of this series. The first 6 patches are focusing on
fixing the existing issues in this driver. I thought that they
could be managed to be applied altogether so that the driver
would become a good, ready-to-use state. If the first 6 patches
are good to be applied and we still receive no response from
Loongson personnels, can I split the series into 2 parts?

Cheers,

Miao Wang

