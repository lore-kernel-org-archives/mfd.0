Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793334495;
	b=nwl/+7GgdTCWXEH6o3im/KlQ7U+n1q8l1k2BuKeiqwYCThmz8X4wWjZV/3f4zKx2SrxN
	 UfcOxfgdufzRDCbV8BuFstiX6y9pumPLPXtnTuR1NUUgniLu2ZRAK4YoslbfJWjl0ev6y
	 TDCGPsJidvRFx3adDIQzr8Y3BuHRAfSXZHeI8yKspFfekCiTX3Zen8IiD3tHNvO5YTwSl
	 t6Tc3M0z5nYLxlD2tjGiLgfTbCRWUmrP+r6Kxa8B9kcOBM0nStlYckEqZCzzgsejUlifN
	 tvALw+enUSkoiV8h+dVYbUPL5KpbmiXsp71SlC2rDiMx+HFaanwR3N+wdUEem758gow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
	b=MmyR6UqC4xGuPeMfHciQP5gCHMmmQrW14H7lHnveMUeEpjEt9cQDqcoNejnBBRlO+1ht
	 5ADA8t0ObLYGsCg711r+9K+DMpghh9rno8wflaXx05ZJDBOs+x18nTRvYxfyID6Ch+vfe
	 rOm869HzUuxHOfDLudY/hLtHSzqXxtzorcgwdtNKVfnT6HF63EsxDZaGiokMMHrZpKlvi
	 90jh/zOz/XA3gYFkH90m64iKdURjxD5FmbV4tmG9J/r9qX+5wjFevQOkevn6GgMT3NxsI
	 pK4JejskHQuWq/bUJqiHZPwuQTOb5Zgzaw0423dgw0ve/AxJe9jlvUtUXSCRkq3kqPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g/fmyc2U";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8092606A31C
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 04:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8092606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g/fmyc2U
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df54150dfso108344f8f.0
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 21:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793334493; cv=none;
        d=google.com; s=arc-20260327;
        b=Nsnc5yGu+ZQMPRdj6Yey0/PvfuFvkzJSytaKM0rnowqm/bazsIkulwh1bXGiIsp2Pu
         2qXTQw4Fe3yzJux/KYy/rP/TALr2+oWtrEH4nVv6aV/7uXyrrT2+9ZFdaRFbPFBqk1k5
         6bQ4wHvmEyiO3d9pv9YKLKy93A0edFiCviuwR1fNC/AwLks/FcLO8PJX6vzaRyFBrdxI
         DCaXMNgkZXFj0rafXhzZcjNGuZrPQiQ//kFzfAYq3TybJ8Um+3zCgH16OeOZjdSXAUzP
         1Iqv0VbpPoJS97GrOZRRN6a+W4qPlFuqgyoLmLGFHFr9Oz5tupY1kSzwwTJOKKmfkInI
         hOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
        fh=dYkb1581GMsqxYMN4S34OTcgTOhp9I0oUd1S/wA7whY=;
        b=jpNwCN+/KNc/uDOOMVFY8O6xeG0r0vk4qmseBvaqY0LxKLbvONcmgLldQ4LeEC94Zp
         Qy+/RqcZifSglJq2LHHkdTy63G02Et9vhCd2RlJ23Cu0+xJ83p05OAgi8IYXYE+p7ly5
         8TpDWkMF4JzHjxbqc/DTq4d1PWKcx168QbFLMdAvT6zMbKCfOfWJodaVuMsGe6i109Ao
         oX6loFWi2/VC1pp3mCcVlCt1Dj9AH82Qc7oRk3y0HMs1AoUKw6krtlPRii5hMp7K6k2B
         vBNtj7S6sQNJvMvduKfroLxgxNj4T0LuscVpPh9DK2+MXc605eXw7HkgnlpsClwobcuf
         G4pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334493; x=1793939293; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
        b=g/fmyc2U/e1OX70NFmoRWwDt+hYxNnIOEUuKksMqVAPS36ACVnJ6zNYenF+hsv8m1u
         I0VBxcQHVvJx4wxdSz1Wzj4M41fHG/UH4UacuUxBQGv99LZna+s3cRoguK7THnZnd2RV
         asJk+gbIj1fqQg92xbjYKD83mqStUPlhyMBTSAR7+jYl449mwl0XUGHrRbLRI4vyPd37
         mRnN8OXfceGK25p7TEDc16hnRSxo/pmnKZmyi+t71U47ALoWwKgq/2lmFcdNA5Tde0zk
         ffqboBl73K5zYdJISGKRPkuh8D0NnI9Glt6voZKJhQS6f0mYWalZ5YJuKPzqSR/FAEQl
         LN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334493; x=1793939293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
        b=wD7GBd2xbUKrBXtcTTs3X3FHUIizwnPLCbbTgt6+OtH+568/3nixbWUsWoTQuhVT6G
         GJDTdxahaid0UnBVoAAYm8nbpWlWKR/lCHZ+pxZeMcog2/7XYNEoe/L+ULe2389/9SEF
         8zxjamvs02pk8WK0mJg9AE+t7UEyKQ3sB0uH6Xx1tS+M9ac47jFPPT45x2WkTz+erfJ3
         q88nj2+T2KBAzd43MANiwB/Bg/Ce6yMxDctchs3AHq7g851hDublQhwF0JdvOIkQfGTO
         tJJlBZ1sM9ivwRIqp9StdNOsyjWd3uTGxGbwBcLGeeICUSBP0dJXAEHTdAzQHRig2/d3
         3A9w==
X-Forwarded-Encrypted: i=1; AKwUvBwHxb/vSMhlZaSxbpv6yfT3Ku8yC0SNYhPmTXG61zMNdo0eLdFkJU+Gt80erwzML+CSXZc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIA7mAu9rJh3Vqpbn8WLbhzhhaRWKmCmOZ9TOPHDwCJesJ63mJ+
	u1InfQYwBlx0FNItZXBmAGfGvH16VNyWxNZg64/7h0TkJ63HFOYl9ZYWa/vbSYfq27pmP6K2W1U
	KRsxJTOtNrGpilbeBZ23IlBkDhyTVQS4=
X-Gm-Gg: AYBFou1aak7T5xwx6ubL1tnC8PEEqJ5HhY01f6BTgwXBfUqWy+rohW8PyoF3pZRaMTR
	NKMuqw0pk9EagDGtpdfbDnJDMDEcHbidWxQjnlVqrew8NrwSu76p8ModUTrSMq72seuhs60WKtJ
	SRN0TWAYt48n0uCccIVerJwSlH9BAEMHEB9BcjqwvbhYXEcrDDHWIGfPZZRDc4LpxG4fT+TMNjo
	3AiwUjnQsGLzCLbbkvRlaxJk4h7i37J7f1D3YP/RUrMEet8cZx1gWvL4Qb/lGzufO6fiwCDbR4B
	lxP8QQ4OX09K846ClROukWxRdo+hbyTvWRWb1ZIXl6dh68En22HXLkMfRXvdKwlEsR3zisLFK8y
	PGeqOsHmBe4AhjkHM8BsSGmi3p99y3uOojg8/vOwSQvhxTTpT1Ksg1hek1H5E9CZpU5Q=
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id
 ffacd0b85a97d-48e6e4f4ff5mr2056508f8f.44.1793334492948; Thu, 29 Oct 2026
 21:28:12 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029192223.462367-1-paskripkin@gmail.com>
In-Reply-To: <20261029192223.462367-1-paskripkin@gmail.com>
From: Eric Anderson <ejona86@gmail.com>
Date: Thu, 29 Oct 2026 21:28:01 -0700
X-Gm-Features: AclHuK8-YtfLQIYf0AJZzk4X-qP015MAb8rXgpTOmu_8xsR17rFa_b31yQUvJ34
Message-ID: <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical section
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:22=E2=80=AFPM Pavel Skripkin <paskripkin@gmail.c=
om> wrote:
> SPI does not support atomic transfers, so it's dangerous to call from
> atomic notif chains, since it can cause stall during reboot on
> orangepi5 (see trace below).

For my curiosity, is the hang during reboot/shutdown random or consistent?

You are explicitly mentioning reboot, although the stack trace is for
shutdown. I'd have expected reboot to have always been broken for you.
In my change I noticed that reboot and shutdown didn't agree on
whether to use _PREPARE, and my change adjusted shutdown to agree with
reboot. Since you apparently need the opposite, prior to my change I'd
assume shutdown was working but reboot broken.

> I don't have rk3288 board to test. However, I strongly suspect that
> patch does not affect your case.

I'll test it this weekend. I suspect it would work fine on Veyron/rk3288.
