Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014102;
	b=2axoAHSbqEsy/LCw2IF26jcnc/p748ScYUsvzA/bpb8JB+MO2AXUuhND3+B6GE2hAV9t
	 E1dWRriwuc5dczos/TkT+/+DM+SzOOkOr6BrnzjBcSpk08XYCV294gmTiN40XD6QhSafl
	 KrF6TA4hOIKJl3UErWgew4usAtj7tSKN2QxJNt5pkK5cDHf6DR09V1vp0ltcoN69lf/iS
	 sDLGZTXwSjTnGyT0qyqUxPgt/f+h74d55zmSpRGz05JJtl+7SyErJ8ipG6hyneHWhzGUv
	 fuVjMJWfxShWu38qEL+o8zLXTfPZfgHoyNGUrwygVuOUFrXuyEj8twO/xSsqPzH/+yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
	b=oSpM/ZXO05qfM6pLM4rAvPKHqs99WB5dOxzFeA5Dcz5D7w5ZJnSthDvzMgQpUJRXHatw
	 rSNZX2OcKkX/y+8fdH0cALrjInX+JiPydiLW5r8Tij6Da445dt9t7Z9rAbbkSLa4RJ7UV
	 TaV8++XNOmIBsgZo3MXwfYn0tkZV3KNBFRvoCLGCMkmtvnl5I2smb7hwI8l4BRYSGbwMK
	 ND/OtDlu2lwz67AeJyYLoiiolrrihuAAsNYzRbu3QE0LDdLXw74C/ckYZedIgWEJxCSji
	 SWV2MqSSTxwGNQKIVuBVebU4XJChS10NOnWXkmVu0ApeL4dIKDggJKsJlGZKxshMaOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BknLw5bd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42B606A320
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 11:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C42B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BknLw5bd
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05b210703so1097235b3a.0
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 04:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793014101; cv=none;
        d=google.com; s=arc-20260327;
        b=XC3FGNWKl6k2F6AV3jYd6Amr9YLMD3MxvkXnURPw6SFvZjGwpQUwYGLeEe2niBpAit
         yXB7wfY3bkG30tw5wbuluRz9JAUAojoUbEVksbeB8fKKueUMz4S61Ysp48TbJ24JIdjj
         cRVUg+15fi62FAMyjhO+a8g6biXNEmO82E1I6Uj+TMsLqsCTd9KJKO8+TOmsm/pQkZhd
         J2im7K09A9BLW+JSKciWG1WY2CtaPbDFJGzjf8ew07NG4dyNCvCAox4tTOaIPN3W85rx
         HGzMKge5lqBOyNssEkj4OFFD3M61cybQ65XsBk4epNSWx2OjH2x5WqO8QFUqnjWTlqAz
         k/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        fh=qmZgQCVSkQey5crwS37Qv3bz+I12Wln2n1WpsXd8nJE=;
        b=L/+VCEn1yJCmqvqRjfLmRBU+EXpcWSNykN+hCtMnFDh3fahgQvzbEkfoBtWUd0Bocf
         bdX+f1hDj4cwKEQwzsTgz1TMeLJuVFWI9tccHenLTvL0IzUGAIJeaXedMkQbB9blwAdi
         KUSjmnY67lexHQcN2dfgcJ1Uxdtk3WSfSTA6VNRkwenokc+0LqnBuKy3Zh6pUXyhbfzs
         8cg6Nx7AKBaEgUUpI9ejFjVhd95QTfWEvD8989mHXBMPe6n5Z/BMASOFu0GI0iCGQFsG
         x4moIQXnSWmTtsG0Mqb1L5sv/C1iBNF0DGRzXnG/t3VMFHeBDmt5FTi9wR/+ltcQm165
         2RhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014101; x=1793618901; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=BknLw5bdk9EE2WdGqrJ+wsjFbrVLJe99w277SrPjbYFGEnCewcgbOS87ZdboUrU35+
         Xf6J40Ct9GnAShhmrE11dwjNMmnT9ZVW0/dJhpvCzxj+dc9XWQ3STGSv8I978w3mnMX5
         rytzpaWHjIkolKxg5Pu69svSwDlyOA99b6kxZD0AYe6VojaOwJSyqdaI2wHaX48LC4wT
         Kl47Ke0OWOm9lP1sqQVDrHSnbC4fQCObUjmfwhyWO5JeeSHTF5iFuNHMnPHX5mNwTDE8
         7h1lOLw9VZnMy863LRSkI7a6WMRcFSsLVeDv7PqCxDnjEXQ4YSYKKxWRZLecAwFHzdtg
         Byrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014101; x=1793618901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=Staa9C4EPqQ12VQh1GuoA81N7oVN7ojCZpWK+X/vb8hUzr6NzdUZebOPDbRkkLsCRX
         KHOXuGnAfyGwXoBSHkoadqAcTKswJ68jXjK6tK0MDJXIuAY8HjD9W3jcjAjUucrDb7gn
         cDIV8qNdvry+Nb9oNAZpSVNpcKoaMu6y6XbyC1HQggkC4rTlFskYmiwI3lc8Gt/SSTJP
         mJ+xvNnZ2cEo5AcK/hS4NgV9MA+rbnosAMccqN7gqHeckymLJoXPqAlh4qMNzQpH/XgO
         WL/uFpNf6L/tayhnbaFhyz/pGIwiE+6n/wOKYIW02E7ohL29cNPNN1CxWop/6pjzqPQR
         4NfA==
X-Forwarded-Encrypted: i=1; AKwUvBx4fJXitYw9MzP6U8cSQo1mvo+PatS/N3gbY+ka6uXQva7DDx29lDjmvbSbM+fpBFjcmNU=@lists.linux.dev
X-Gm-Message-State: AFq9FYJgj8Qkg12awQE+saeJHhMYJ5gMNy8GDcdQjgk+Ii1phbwjWJ93
	9sfqYSlzlCZnk1gsEzNrfkxleeHeqqmE1LjLgykfpY03WNqJv9s1qK/KUFPOTpVrqxjsT2e/Gt9
	oK8OXJHagWNWFkL0dVC6rL9MqfKO/xSU=
X-Gm-Gg: AYBFou2jXLqhMXX9A3KBLw+ARWunUVSCqC8rdYNWsMOPJijr2Ca/bQPyPXajnaRyCmL
	tEg1YKVE/y3X/KJltw8we0ZVsHwPrwvWc2W+OYtqX/D+BlqM1OGLbjwsFQZ3RI3eFhp3rvDpdiY
	FMb4xQkURI4+smoJi4lXX0T9QHHuPTO7bDqMxD3b8JZFTseZ0Z2WNaP7Eh8GJV/6f5bsw1DkB7M
	3uiqEvtzP33DfsT5SePsG5NkO0+fYuaq8xYnUzoXnxAlZKm4NgChzdHbSZ15/j1v7YJG0DUAaXH
	GegGV+kcDyw462JlHRR+ZjyOsUrsq1LRD0j7j+wu/2qsR+aJChDsB5GyzWFIDyfvv+kADJOjhSo
	9a+sGo442Q5AS2rIIPPbfr5gkJ0kLXTW1cBgzcnjsugRzz9asSxLA
X-Received: by 2002:a05:6a00:bd81:b0:89e:8915:24aa with SMTP id
 d2e1a72fcca58-8a367a36becmr5121820b3a.18.1793014101519; Mon, 26 Oct 2026
 04:28:21 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026103730.3a79c2e6@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 11:28:11 +0000
X-Gm-Features: AclHuK_DqqwJbE8Mxuk5nig_6kiigbCl4FyLzQRmggV5Ihs0oknU8AOuwlyhfVM
Message-ID: <CAAxh=jtYnDNQTUOf-cBN=w1Km+cBFOgrW8moNbHfqcApwxXbgg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis <alistair@alistair23.me>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mainline, on top of linux-next. I started looking at the hwmon IIO
bridge. Coordinating and cross-reviewing further work sounds good.

On Mon, Oct 26, 2026 at 9:37=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:11 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> > can not power the panel only during updates.
> >
> Yes, that is the common use case, power things on, tune update process
> to the temperature, update, power off. So it makes completely sense.
>
> > Read the temperature in the regulator driver instead, as the TPS65185
> > and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> > on VCOM staying on mark it always-on. The regulator also switches VCOM
> > with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> > directly.
> >
> > Tested on a PocketBook Verse (B288).
> >
> Which kernel do you use? Just curious, maybe some further upstreaming
> actions might be coordinated or cross-reviewed.
> There was discussion about in-kernel hwmon readout interface like it
> exists for iio.
>
> Regards,
> Andreas
