Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499885;
	b=or3XjLyZRUMdGlqLsx2dlrAQAd8w1vR+kjTh7GSDzcj6aT0Y2uPQ5nA8Wc3dRPl1vH8k
	 Rnp/lT6XPHanlMp4h2Jf+DRVTw/UNu9kIMekrk5bKdplAPaoR0p+ExrjaclGfrdDDV8oE
	 /8ngQCPtlCcLnLUUn2YCcbgRcQgluHZPVlrbNhF6jBAlZ7K0d0AWBR26CMnGHXg+kD+Q2
	 GJF+IizN3+xngUlCD56ym4UTX0pfQ87nuudxR77VTiU58FXTAJrWqPMeIgBk+cIYjoFhp
	 QrmlPWQ9cWpzyohU6zk8iDMDjIhyrKgV4p34PwiNRP7JA6niY4lGfqv3GucmjnEJh+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
	b=tKyWaKvIIcrMpXNQjIwdMk2cAR4Kz8BDpA1cG8s4Tud7IkxJrTBu/2GhG4WXclH3o3PJ
	 8pxBpoZws5Xs8uK1vKo81NPJ+XvRrNE8/CqcXFENWVQar6xVCk0yvfWmkhhJtEftcubPo
	 fbWQklnXWamAEwrDI3zOz9R3x3WbFEzMoYZ1iInJEBdxDRT+KtdYlDikjOL8K9y30nOtc
	 GLR56wtfvvk2ZsM8ArRw7MAx94VNBAmf8r4KUxdrd2VxEyeY01xTjpzAE4QDxIv5bZ0qa
	 qVtPRESGXbLD0mvKaD72Go/+rhq5QTCLGDj9pzZ9up6wHVaDhWYoldOzl41ZZd5Kx/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f5GoPOMJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C1E606A319
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 12:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C1E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f5GoPOMJ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so5743677eec.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 05:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499884; cv=none;
        d=google.com; s=arc-20260327;
        b=NfvznNlsPAPQn6sqsVMeF3TfcE3UNZpjmasFDDZfiACQHTPhuk6OoQAM12WTBZuOqk
         +ta3O5HBILe1GU3NN/CbhKMCTAzrS5yflQBr7g0F9Sx7r1gupDYr2SEZn2QIUn9flk0Q
         /glTL4NQGDzc/FMGviAF/d2+DVsK+QRKlUgSPq2ye63SeSlrXy0R3s0tmfRqBcNDc5ps
         hNQjW8/BtBuX7IKhl2jfJeUnu1V9kGfkjqP6v9erKywTFHYf/qD+Cbsniu3GlmkHTodc
         9mch72hxhnCSj5ldUcVcsp0KQbRnaDF0wkMSi6tNg0T9AJ3ZpDChTerVXdthvB4Qo9Xp
         SmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        fh=hBKnVu5/zSLpcms8My7juGZZhbe0z8OqytJjH9FsAxU=;
        b=H6nVrbhJZB5fmuLAfZSyTJmoe/AM/XgY06vxye1/PuVk1XiNOQ4OJh4Q72buzJBJ3N
         K7W5hmQFjmeDnB9tRDQKi1PeETkylwfQ7/SLGT62hhKprfXVEbgfS2byxG5hk7sPHl8m
         isjac27DX8lNkdOLoSISXMN4GR5ga7mt7ESeSIbcdCXNqJKIyc+bKB9Q2nEczQR8j6hS
         HH1FEkMfCgZUDFNjfGJ5VD7VR3x9EA5ysO8NAABQvZzvKu5CIRA0W+wmVwTBjbLK+5WB
         kpBBt/smGh/Q3/xPgnsOn9gDueaDG67r1sd+9gKwzGyfbACCUFj9e5033dssm+3yro67
         uOPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499884; x=1793104684; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=f5GoPOMJotYWjDfhaC+oDCcHbSqsuVZrqo0Hru0xgXTxQj1gStpANUCyubdZLishTv
         aOyjaCzEF8zUbeaFLV2WgOA67cJWKzvAYddrcxr4IH4Y0Y1DKR+qFZQ4A9hU6J/tEP3n
         RWBDs67u6W95jDDvzvNQUxU4hTqxD5nD+YROar7A4ftULzlbSOeyLE2juCcNew6fW7oF
         reVvwqfOWb2WR2mj7GT7VD2bo9DFbvnODuYDIa7KHXU4JjkgGgbZQjYsaCigxU6l6q25
         4fdpH+7wa3+dfkpj1PLgRV4XLVN/62EDE7XPMxifU/o7osuf9QedAscozepEINRfYSjS
         2uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499884; x=1793104684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=YGfzC1DxiYrJrJLk71GtnYoatw8AGbFZRlLJZFenaTOI/zR0pKf5qsFBTfeuBPQoac
         z9uKMDlAmQZVwQZHVCy3iDA9txS5tbh8X+/uXWaMULuLWPlKtOyTf23vgcAoCwJn07SA
         /xXR7CUlH8xt40aE8Ayhf9ctQHxfeZHVWYfglwu5kQ+O9WtCoT/ar38rYea95QY9xS/g
         jbJ0y7YKSCpVnQA9oAQonsn6gVoH5qAs06hCuiUKBTZ3BEGl/XrttIuHVN2ex5HmT1+i
         p7jzVFF+Yti3yQOtqjOQZReIh3lAf3S3imFH7RuZiykc8+J6lXTlmpurmNNaByblv3UL
         mlBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuiFhJwwCrAsCRIk5kgCLe/VNU5jFEG5UyJEu9I4czefeUbr+hDLT0qbCNklNMrLb1lDQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKfeXWlRFBcdixMahmXMJP82Smiryzas12cq95T0dmbeZk0YXtd
	J558VfqQIdfjGyMGtZ0dSCD2v5f2hrffSt/BeCR8bvF8ZJvZ5Ee0EkColTqWjIU4xUTnuVtaAFU
	3rUZ6uHiqzxqmTxgCK+HxT1+TOPeGOB0=
X-Gm-Gg: AYBFou3mLYNHx1kXDKKvoj8n4AXeNIMiOqc4eVnyvzVgzVXBkpiKPVsxkYDxVDFPmmX
	eR4yowtlyaVyv3gAbHCGcEAG+EZx3YH2hnIBCl8tlj11S82cftjN+VeIvyLXgNBERyncqTsEr9s
	2aManKPVTYOcIstrY8DydCmYfduXKcfhl9d4mJbQoHw4OMO1jC/RHC7ox1Y2Y1GcObOTGIZ6LPh
	laaR2CdzberQ/CVDRdbc0ph2SVLeCyG9MjlJfvftV6+meHNb4yUqomNyvq6dvVg/vQ5p6S+i1ei
	hvQMRuvXN7EFWYlc1UClriGKK+9YfSIL8UEUAQfeDmmr4RS+dkS6dKjaIeN7VxawXYQ/LQNwInC
	2oXjHwTv1BsHbIAydbd7xnM0=
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id
 5a478bee46e88-361a341c8e6mr20929064eec.37.1792499883433; Tue, 20 Oct 2026
 05:38:03 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 15:37:50 +0300
X-Gm-Features: AclHuK-m87BDNsd06OZo9qyUn54gIAUFrBH_nvo3N4yUY0ynQqrl04tZBGoSFNc
Message-ID: <CAPVz0n2qqMzhbMt+dTaGv1gmrp1xmxJP8ZdQV1EcSpKkneFALA@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Florian Krischer <florian.krischer@fkr.dev>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add input driver for ASUS Transformer dock keyboard and touchpad.
>
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/serio/Kconfig                   |  15 +
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
>

Hello Dmitry!

Would you mind to add your ACK/Review to input patches so this
patchset could be finally picked.

Thank you!

Best regards,
Svyatoslav R.
