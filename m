Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794397862;
	b=LamHYuPn8XO29tuboa5dM3eO4nj8cpBLfnbQm/NQ4efGt/tc0BMzvdEGrxp41pNL3vDu
	 I9qhNeEFg9wFNGc3S4upSe9E7Dn6ieBytUAxTxnlP7eILM6hvvcgPBMwiCaZN8E/CAtt/
	 GmeEihL73zQYnWwnWm98w9RhvhcVyFxbRfabzYrQA49JELdycOdJqCyp6H9WQBvorE7wg
	 TDqU8UWaIWIVhdpWVkl5W9/DcR+O8SWKr6+9YYMC59RuWfFET/zbqHNi95q+JwTDzkZFi
	 jXaJrJfEs8nhDo0kgJdxxqszns160AUr50Q4XLKB1EbqWIxtYD1Vij3GzFHYvKsOvOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
	b=zRQla08/mwQg09Cr9nBf03HkRgv0nuf8fhMOGxVnTGhIFBurobLnFzXcE84RtATUjPWe
	 mqWJn5WKo+hK0IGJLZ0nBAvloTO2AXz3FgcYsuSwqSspoaYMbaaHiwIQAaS7GMMxjRET7
	 7Ua0IeEkAmzTxZU30r0lxjctkv8sE9QxkI+xBkBLRTPYsKgAOw6aRrr7wBAKenLaIif2J
	 Y36Rt5HS3UDWgkVFdydK8mkwZ3DfXp2pVNQlV5rqb1XLRSuWYC6HSC+oNa7sD9uAshIVf
	 PI0QDYunqP5U1IMvreEND8Y9qIGvlNI0YKSLMYNPieRGT/BBGqQ7PFXW4jL/N50sVsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=puOTP7bx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454A606A33C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 11:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E454A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=puOTP7bx
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93efc0452b5so203816585a.0
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 03:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397861; cv=none;
        d=google.com; s=arc-20260327;
        b=p+SW9ntmLqmjzt1yNM1/57tNix8K79lhQwIbMEDIVHieEVkftqWjcaqB8EkIB5fkSW
         McV2KutDnGjTfxn3d3EGlSmAHRsfQUI/Ohx7ZGRoTUC+E3r61MiY89nyIevEWHWFdTRV
         LwEohglWYD9Z4mMXUWV08zQloyWfUAdVjQ4gQ6kLUc0iEAVHasZK84xqBDfzpvxxK/MY
         +ua+KzdWE0Zu72Reot1Y6WAsGYpqzgvzvJ1OOiISeS8uqlx2sghegnBguv0ZLlphWofd
         Qe3RMOXpv1W268dL70CbnimcuGscN06LBDfQ3EQIqZFdAwKyAGhmJC1mqJd+ruzCmjXb
         s26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        fh=z458IZFj3BdPSgJ91dfqSBThnAen4rd7/8GRSbSePB8=;
        b=g0Ewbdmg4Y2oMG28BDpvn4BhZZUF3RIs0BO32s5q98RnsR1KxLISUV3RYId0y1n1cq
         4KPkvw+p2Yz4VotHnNVfn4MKZngyE2na5GpXIU31ktve0o4UC9ZcWiWovYNIjrmvwaft
         ey5f+NyehMQOTJc1Gqu7xjAkAzTovYOYNkhAR7M61vzUZ5w2v7aeS4YItuktmNnTvmVG
         0Pngt7BRvZVwtgXI1p8DgxyaKNGj9Hi+AwMqVG3f/oJYc3C9GP10LQ3EKMuoXid+xHES
         GsjuwwKfV3cnmOXE1zEGBOMPIxpVyTImYcnYqxKWE4lhD4aQTx1eFWDVm2tfgkKy1KfA
         ql7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1794397861; x=1795002661; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        b=puOTP7bxPip55+bSbfoCQQBcPDP5DQq377i6UnqOcaZDd5goQMhiApKO7ymHBK48yP
         JJVru6zH0X1LOH09tGvDQcKM8cV31Yygo6LQYUCDL25AGuEmRo3KNaHt1tgmlNTK1b0g
         sbQA9RdqzRIzmNRgTDIzCb3KC3s3lKlw8y7zBar4Ks1KAd4Ct0VqnzhGDAvfzDHJ/Jh+
         EOeLt9W4RydZtPD4c3Kx7zpanz698iHnLnCOzU788UoutzMM0CGTD/I2LLXYQf2Tixs8
         lqM4JEju3I5I6igMrwu+2abcUNz3BGC25AQFAOtyVsbJP8B2BasKeRCleoDZ1V9/GI6q
         ggfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397861; x=1795002661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        b=o/ima3wZ0JjgpOX1WR+isZBJobMdg/cnOOPysEFfSe+NY9SxX4/8nVGE+Cja7jG5aC
         xeULE7llc2Opf+0MU54hv97Me5rh6MhSCEaQTUdhk0wBtYQqLcYG3/qfubqq7EzW78Hr
         yZA8F5q8EAyrFRwFKx/n9Ww+pX+6R+oA3xWqwgD56bdgfQoLYPBzZiuOQGwuJIZ09ymQ
         mu24WO64vYfmB/cZ/lf2w5awcMBppcYvMKuGcPcNxXlkynWYWxPBCMbKbxVYx5fqAQ2E
         UZ+YYneLE3ztQNEIF7hb6ia1/ov+PgQL6kNUg74XdrK2mh6mUG8Aleu2KCWTSEoin+dS
         WTBA==
X-Forwarded-Encrypted: i=1; AL+hErEy8WeqgcQCl3ItaXxhluTcalUvlIpKxdPw7FHpWytpyuJxKGVhnelBpxv+PHNLEtd+2AM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9WnszvhIGjIX5P7GlnFWBzDBmIQTPF2q7+NntH1UWxtoLbZuVw
	Ev827qKsZeqCUiUYLYnoG/h64mfnaKED4NyX3ngZwDbS2NOvJrUeGJU7E5pJKEo8n44RLdCu7V2
	jZIE7Y7wePkUUX4FuhEg+dTld1L5/XtXcjH7TsFm6LQ==
X-Gm-Gg: AYBFou0eicDRRHQZNELw0XjqGSvk6WUn9Cgaa/SU6eTpTy+0cVP90i9IsQydpLb1VrY
	qKUoyCsjrQCyzOsGU0HrnGyiGoe2MawOscIIssCBIv4DDLgpMtua0BX4phsMj1hn679Z5pVid4d
	1PHzVP8NDYXIltmcJONBS39nQSuSHWnSnAkMgS9G9m2EYlfMyneBnsv8NHHfsFVrLw1ffYkDA+3
	+CWbcx8J7MmxmQBEFZUlOzBOGvocGHkLz20/oXhPwDLqecZUnnE7OPMjPGYS2XcUIN6lRBy7gNf
	HzLzT6Pb3W1LxTm4vWAn087iXNNLFREpPn892rKhgtBbsxjTSuvYcpSvlfzjvfR0nuyfD+GwVQO
	H9Qk/dlkbUqoZdg6rzHB2ke9LOhVLtTGkAgyr2CDPgPnSPoZp23H4mV0HDoQ7hroSM3hItmgq86
	YrfplFLAAurMLdhO3k
X-Received: by 2002:a05:620a:8908:b0:93f:34c9:9259 with SMTP id
 af79cd13be357-947affef9aamr308328285a.50.1794397860820; Wed, 11 Nov 2026
 03:51:00 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
 <avQrO4etMgpOhvwF@ashevche-desk.local> <avQ19KBnQ2mnhZa-@monoceros>
In-Reply-To: <avQ19KBnQ2mnhZa-@monoceros>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 11 Nov 2026 11:50:48 +0000
X-Gm-Features: AclHuK9yXImPSOD4H34XxYmcqqFrOLj5GBNrtIWsMZD69B4vZ4xDk3_xNWS8s7s
Message-ID: <CAA6zWZJd7Leaytnf-BfHu5ujAnEhTwSB2007KXnV=eE=pvpz4g@mail.gmail.com>
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Oh, I wasn't aware that Pawel is still on that. Initially we had a list
> where Pawel indeed was assigned for acpi_device_id. Since then I went on
> to do these changes per subsystem for several *_device_id at once
> (instead of per *_device_id and subsystem) and stopped looking after the
> initial list. I might have mentioned that in our internal chat, but I
> take the blame on the lack of coordination.

Hi Uwe! My bad as well! We just had a chat and now agreed to proceed
in a coordinated way and do all *device_id changes per subsystem in
one sweep to reduce the amount of churn.
