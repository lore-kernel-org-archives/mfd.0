Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0AE442B2A
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807790; cv=none; b=Ee2kgj8w65WXhxqNCF1Rzb15STjkbVdq2HNwSEHBEghIrcIzfXXuqX6955pEganLjMVCd2ikNBjprGyCt7jpoy4yMIl1ZvrOlKEahiW47AdFg+b3/AoeA+PmL0YKFDLwomyWj02/f3NxfxTy9tj0YI44u67CAdRoTbqkD+AfCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807790; c=relaxed/simple;
	bh=9sTFHc+zf0XkHozcwpnccFYJD1vNkwx+xd/I8fdzXII=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WbFmW6uvRoKpTOY+IJRUCTqJwCeHjnVRRrbX6plG9QV3xSc8wa2sXqrRgEKqCyySyZvgyvphKKWFX0Mxay6o/zhiiYwIgIebNo6UepSIv386LaAV+wLAjQn/VPxJlN0s2xP5/2GAhmiMH7aqd/GUkMvC5i8TO9W+NT9CVEc9EUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9OMIlB2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9OMIlB2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca957338f14so149572a12.1
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 04:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784807786; x=1785412586; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sTFHc+zf0XkHozcwpnccFYJD1vNkwx+xd/I8fdzXII=;
        b=C9OMIlB2f4LKb0bUydQSGmsmoWktVK3h2e3toh6Psa04l+ko4sYFqY7HL4MycZ3tch
         /ZnxSYJlbiCup2Cj9ngBSiQnmSFBU6T8NWNIIhdP6ys0RK67zAjlpWjd7miP59Gfi/XZ
         Q4w2fFOkDi851w6k40422sl/a1hWvdgJLQ9g7UxW1QB+zH0sgHOCP1l1pywEfkKzZDp1
         a1XY3K6d8JT+UrMIyrcCJ012XSb9WlMsuAtjsy109Z0aiODomz0kvKZmUu4QDn+KU1Bs
         f2XVligUZkOdEd36CvjMYMAYdaWsqHz6RSkvH8uioqI+fRzbjaayAVmBWpvKuzkUJyEw
         D2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807786; x=1785412586;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sTFHc+zf0XkHozcwpnccFYJD1vNkwx+xd/I8fdzXII=;
        b=Or/S/r+0J54oCVtltqWaUaX287q0kRyn6thy6XzsEosV4kF/Tc2gRasqpogylUg6Ip
         lt9MU/uHDmviUIvTipmE5fZn8He8wNhLJpJaI3ouUSy8YMw2wUrr3OJzfzJcSn3wFP/t
         IbYnUpxaVkFedoXcQ9Vd2BXZzDj4PAXt9U0J+HJyBiiNSlkNpinYoGDRiKuQsGbB65dK
         4pcW0Lc0EawSzRL8kmm8x4AMtjKP3samwMvJCmc1xYAGbE05LV9TN+FOrshS+OsHJ/M5
         WUdzPxd3aGYweilAILMLJA7s0HWgX0Yq3sQZhTz/OaXPzU35n1gtjsD1PyOt40+vfHLq
         MF6g==
X-Gm-Message-State: AOJu0YwDGDtVzCrRBCJdFqTLku91VM6nliZBZVu/lNiwCkMsH3Kysf6z
	MmUZIKxxgkQEgRKo4Wr/zO9R0PY8Jgssrs7UywI3aeCaYeDr9y8cBLI8
X-Gm-Gg: AR+sD11xaz7vcxyoPqSmlaFzVs9fMZyW+N0SKYW+iDLDm1ll4+Xh3pjiurZ5KjIIMZj
	6KAVoU99SHGktvBaymDiS5FG55akeChgbZyQpnNs5UTxcvlSrusJ6BauR/tB2zYN4HeVaU+jBjo
	s34GyAGY+Nz8zcgwSlxWqCDVUTXDd4zsT6DOFXJqwOnzVDsivc/qkIfSimnvdhjMJ51wMsLCGwU
	F7bgm+KkJfviGkJ/p/pteQfcn7aWJftMzMvt4hSSAaH76vI7+1fCFhqIGSIAZ/g3GLEQn4zNT9K
	HBW0q3ssqx0gjUK+ht4eDkB4tgdmP0Jp2PmWy+AUC5JUTufYiXDPUUbRleuQ68IcDTmaufdPfOH
	1fWQn+fWNtWYjeUvLghZ2pFuVaUl+l+Z3yUN4RWaBzec+wyN1f9hkDL6a7MxCOIpltogitZlZaw
	fCqzxbu5cAOvFDdBtRbDDfuakuGmE/Tjke8jY=
X-Received: by 2002:a05:6a00:a29:b0:843:468d:780d with SMTP id d2e1a72fcca58-84e3b79c2bemr140629b3a.3.1784807786132;
        Thu, 23 Jul 2026 04:56:26 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175f1e8dsm2989350b3a.55.2026.07.23.04.56.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:56:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <20260723112903.GB3363113@google.com>
Date: Thu, 23 Jul 2026 19:56:11 +0800
Cc: mfd@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1909632-6D06-4648-986C-6B7867D231DB@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
 <20260709174055.D25E71F00A3A@smtp.kernel.org>
 <20260723112903.GB3363113@google.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 19:29=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, 09 Jul 2026, sashiko-bot@kernel.org wrote:
>=20
>> Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
>>=20
>> New issues:
>> - [High] Unprotected access to `gpio_chip` without a NULL check leads =
to a potential NULL pointer dereference or use-after-free.
>> - [Medium] The ACPI memory resource search for the GPIO controller =
only checks the first memory descriptor, ignoring any subsequent ones.
>=20
> Looks like there are a few of these to consider.

Many thanks for your response. I was preparing a v4 to fix the first =
issue
found by the bot. However, I believe that the second issue is false =
positive,
since the memory descriptors (if more than one) in _CRS are ordered and =
the
position is meaningful for the driver. As a result, only checking the =
first
descriptor is acceptable.

>=20
> I'm unmarking this for review for now.

I still want review for other improvement suggestions. Thanks in =
advance.

Cheers,

Miao Wang


