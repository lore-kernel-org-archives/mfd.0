Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118176;
	b=zlDLQjenr2aoejia4x43VuYQ8IGPgjk+e5w6YvrHUdsWh0RZHiApopWGjEN+zpe8t07i
	 anyz84FU4mtS0Yut7Wrkr8602fkHBPEyPCr5FtnvVsYqA3MiXH9v4YjkeBecKlN723gJU
	 wC5T88YacB/TPa4HrpET9DLOuK0d36Rb8LFbqga+2THFlGVlLwx3KYskStK/AwNACVZZf
	 80lyZC5mNdv/XfRIf+5EpaktjlCb0+T/cU5iblYWr6z+rfMOEm+zA1ZbB4X1XTqOPxAg7
	 f3QzyzYUxusGqTTl2+S/hL0mBtL67K0orrGu2eb2+TzZJNz7FmjbOVh0saMiyPO4onw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
	b=JXrNPqWvsuOpNR7H4lXv524sNmQhqtnpe9S8kulYM5ZdFXu+vT9n+1OhCpnSfFVyRr1V
	 t7bRmjM2BGY+/GH/oUD7Lr0JGyzY16vfb3P8PrBeVge5sqqfyAm7+BRXZa25jXMZScy7z
	 uzlaJo3q7RZv5hHp+LmkX5AzIwHG5N+99ZoSeyuBRbX1aVHYRgSKr7asJZTSW7Ba2eVkR
	 x2AopQcFO3qCFlYAIIk4adSA5R7jVVqDkSbAm5VhN34Bnq8ZbMLBd4ApT7SzTMV6CBYpH
	 DpsSNaIDb4x4XnhiwRtlQsdL5ulVhspudSysRBSQWHVurJj0ei95UZAdxt8fDNfeL2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVt901dc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9060A262F
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 16:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D9060A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVt901dc
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac8a2ac52bso455497b3.0
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 09:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118175; cv=none;
        d=google.com; s=arc-20260327;
        b=r05tPOQAhIrYgGueg90h7e6A/CsyBMLtYJS3Izg00K3FqF4TwwdkFkyNQWkaqQc3Pr
         wHPlZ4AA78Po5BIaM8QKAqNFTaE+V2m89zvcEZfs41wGjr4q5QLjAwfvvRw6o6/1VDCa
         xrKyj79uQ3tpdBwmtv2eJgEYn6IDo7gXpZKjSpdptkQ6sbmylMEFRHZu2frY4DfUSKEM
         MY1qi5xmCeA+umKRe3h8lfpwrT3xczMQFqHho91JRHaAWqe66AEN4Sa7fvaD8f5m1+0E
         iLt7ZzTG/Hf1Ffhc2XBURgdI6uzPaGk98yQ465MZDdnUCNB79KWovejHpvN4aJU5OMNY
         AjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
        fh=cfDqmsQ5wJonlqN3MXXVotEx/yvWDsaO9SA9+kaS1ps=;
        b=KwbQFCVCPObM6YpG5rTfGxq1UdiVh8joQSpxfSnLxFrCV5i9Aq0kAl152HhFVkzg7z
         UJg8cNiViuqNZJM2HpzZZAEIs/qxL98Pzwon9GJyhI2Ekgtn9eOKeYSgKzmnIOwMnJXc
         qWRwtY3f7AnoI4AtQqjTxvtRka0I0jhrvVShAW/byh1GPlhj/u+yjVSzYMU+wcLICggT
         pkroi7BZGKrh9mMJ68xpbK+H7v2bz1/x0JAb0ZaYzujI1qVejRNUw7x7wXQT0s+r27FX
         l0cX0lWvyxcZlizHEDS5SDtYYIM4OsZ8RrthtMkuIFOMJeUST1TUgP9E7j70Bo2q2MnF
         +vpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118175; x=1793722975; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
        b=BVt901dc6JeXkH7gesM4WH28ad6bHRQpW9ERKiZk4/KiZ5EMKMddfsYoXmZccJyVhh
         OYIocvPPORSa+J201oT4oIQYYdk6dP8WVv7karyh8qNG+2KTf0JUEjl7E7dHMVKoujNq
         6VO2i/8rlCmaCWj/waLC/Nx4RTk+tKijQ+2tHcccJ6VBZfqzc+k34Sc+ppjb2BzFr8EJ
         VbJWsTE+XF2ziEUxA4kCrddpFkE6xogEi6NhKdEkh6DrQwQ2BChUSELmsF3SXjl9ya+q
         zeO+3icSbCm4i7reo7d7HH/hK6ckDhZQHFoFMZFm/7PYhKiiw94imN8H7ewwYEQm80u7
         Jc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118175; x=1793722975;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j54dq75J+7uAbhmduFvYuY44W6HJdtNi7cBNY+H2V68=;
        b=UxAg5TQBAyX60fXda4iZsPdjlOiayrF1p5+ldGVV8LrjHEqyerWC+atUHXieEhwJK5
         GfZ1pP3B5Bz2SqQ9aNuo/wMEq3IkTGi9QkKW6DQQg6KZegepegTht6h4uB7lbmVXS8KE
         PNvUdJ5K/Cz9WqWk3lYGPUZLQBnZnt0xuI3rjicKDxRohhIvRnzbeLqq8zOFAkrsQtrB
         Wjtdxh8Eu2YOyYlLt3eX/fe8owpbiYp8zBoHSEm8QOcgjRHmXZbUva5UuhrY43TIV4sR
         Gcf+0n5yexjqjn1t2d9jByL+XbcYaFjcplz+t2YcFyc8tqSL5blazVO8WlKMZ9syYX2x
         Pi+A==
X-Forwarded-Encrypted: i=1; AKwUvBzA/KtbKx9AlCbExdql+S2LPRlzwJAK7xbCwa3WIHglTcW84wME/lS5S68E/bhBO25XVa0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLI3PiNRnKP6FuaVYWU2iSzpOFM8nFIX1OKxnd4WzWNmXecWews
	4GCcvqn+WqftBc3E+R6Dl9KyANpjEY5+/y1FSSwnOeJ/LiFe55/56vBcPYPNMLB9Z/BOoMczh/9
	RnWLtDkvQ+SRBxLblwVsf+evpgEIOHnU=
X-Gm-Gg: AYBFou2186/hxviyBilCQpy89TBVzWgTXLLynmrX9s4P0RBYAOZCAbFqUJaoP5SOnlY
	iRgapcUJMBknD7hYhwj2KBoqB03emJyXRUxhou99PWEkdiWr+K5Q+B5i81RDjRrjZJbjUMqTd2r
	RI4MjJCkvEmQvgEd9LfTqJNR7KZKbH3mx2U03hALukNxyNOUlQ7TK25+JZ0e8vM3BPW3YPKrDAj
	IErJCWpSasN7JBreQbuECa7h3kA3j9LLLH9tMxlS5QA40Dl6De7ewlL2Uq8xbflktif1mcDz8p9
	NCl4ANan2BUo5TgWCvIQPBkeXOIV0I/EgtMP4gAn892xmxFlVz/wZTr1+5syHUrLKB7Gw0H1vxI
	Jwg/6373Yf7Iu4ipFpmbmIxAOjaEIn1HNO3rfFw==
X-Received: by 2002:a05:690c:fcc:b0:8a8:316e:5973 with SMTP id
 00721157ae682-8b19c9f0c84mr27894277b3.14.1793118175296; Tue, 27 Oct 2026
 09:22:55 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027032609.119226-1-lgs201920130244@gmail.com> <f342a5e4-82b3-4044-85a3-10cad08595e4@kernel.org>
In-Reply-To: <f342a5e4-82b3-4044-85a3-10cad08595e4@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:44 +0800
X-Gm-Features: AclHuK_rUH-wQYjXcUxpNAITglYIi677x8p05GEnBtjGRev3n8Z0DOrQJ-qbQ2Q
Message-ID: <CANUHTR-SJTiQvo__wbqosSQV958fkHGY33YTRFor2=EwDTdXPg@mail.gmail.com>
Subject: Re: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 04:26, Guangshuo Li wrote:
> > twl6040_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. This destroys the IRQ mappings
> > before the child drivers can release their interrupt handlers.
> >
> > The parent driver also registers READY and thermal interrupt
> > handlers using devm_request_threaded_irq(). These handlers are
> > normally released by device-managed cleanup after remove returns,
> > when the corresponding IRQ descriptors have already been removed.
> >
> > Consequently, free_irq() cannot find the IRQ descriptors and the
> > allocated struct irqaction objects are not freed. The associated
> > IRQ threads also cannot be stopped through the normal cleanup path.
> >
> > The probe error paths have a similar issue, as they destroy the IRQ
> > chip before the device-managed IRQ handlers are released.
> >
> > Remove the MFD child devices first, then explicitly free the
> > parent's READY and thermal IRQ handlers using devm_free_irq()
> > before removing the regmap IRQ chip.
> >
> > Also update the probe error paths to release successfully requested
> > IRQs before destroying their mappings.
> >
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
