Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BD4EF127
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663921; cv=pass; b=o/X6xHd3GYhQ9AYBxKtmr7LspXWOW3X9yHB8LfH3xbBOICpAZxRTskVXrMmIYahvFtRntna736HRXuzUW/iYX0Ak6+iTXJ7CdMOVJyY7sR/HW4ZLBOeHw8PyWtYKFj54YCdfuTbJxQP2yeUyGNGdbu11hh3GtpIu8SGsTYWk5bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663921; c=relaxed/simple;
	bh=hEHMAKUllCDwfWN1D2DXADtsf72BtNJRtUxT6u8f6tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZnVB80PYN6XUdlv3YTTGjgvrUfafRxwZ2i2vFGeDqiYT0wgUtG0MKu2wpQuBAkQXT3zk3X1j9TUhsiS1AVsWPr2+fVnNju9rbpd9I+GRdkPm483+cRuLXS0ijPhkhG/+AdGY6rH9qUtE0foOuHOC4AcOH4wwSPnogVf2xfCYAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEaa1vkT; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEaa1vkT"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1900835a12.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 09:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663918; cv=none;
        d=google.com; s=arc-20260327;
        b=sy9aKHHxok9sTyVg1a/U83z7zDq1dwdOXtAnnp6zTtVSeaE+mvZ+4xeyI2j+czujqL
         5LAJ1aOSAIP0gqWYJb4ovFWL45fmvtUezddMxfABDQbNWdCT5bC1BHGu0qnxYVxl027S
         GA60CHvvZq/jkT8ik8WWOlDPlqcgWnulj93A1b1MONAgVtD6BcFXRBOa8Tv6fDfUaf7v
         ft+gBYcWOHtziRdC3+pCjnckab6f/1Yepwu4+Zv8aeYSe/TdvXNssf/GlEqz5/kcsXnt
         tBIQ6NTZsgFhcCuSj3cY41rkFgOZ7sBlGNkC3Pdn2dHT5gPAoU9exijRZ6e8lBR/fy+K
         Gcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        fh=MWctrO/KTii1gOu1qnjnDrgwstDYUcJDX0taCXQYJXY=;
        b=iybXORZxtj7j8SX5oBseP5RUrBwzaEp/ojw0iwKnUZdhGqA3PN/QKagB7TBcgZq3bo
         qxVQYc6Ve9QHLeERKgxO6PBnw5sBw9rRpG9bUNtMmcqo2UTVJpIROmr/fd/xz8D8QZxs
         tyJ2K8BUdbRN8IYMEKibkaYu4LlmPnojuXRNAfmK9E7l4VnRzXFGbB4IgJFxc1UD/jfN
         ZRnBTp2o5JOElpHu70YETjUB+Oxs6bpWT0eIoYChmnTYwEJkweQ8/IeZ15+ye/x0pK7J
         EmmobHkEZKDE3DD7PIHioc/8FZkC3RrPKc6GhdaDHMdv7zDPQ9rH/H7kFYq0rveAspUp
         oIXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789663918; x=1790268718; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=KEaa1vkTMEYcheYJgooJNUPZ4Z9Ap65KNTOhoPFmsS5PAcFRtHIgOKvpZC0wMjvi2T
         pAiW9IWXjJkgGeqT46tg8kDrrF8rbt+nXBxSc+x0pVi3TZ1fvowN83YLiBMdFugGj1SF
         g8s+LXROa5SEjdbjz5b7NuRtvKH66lUQdB81UhrYVfOH1pOzjAOOVIxPHMZU1hJz3pDK
         y3H+T/Y5DMH0wDjCN34Cyav/TfeG8IbtOT6S1NY7YUrA83n3Ssa0iuUDbRuvRbwnV+aR
         j3ZsNq77I24biXKIN+rTsKRjlZnR0HhVfSAYvGlRTZV6h7zcxeDir/V6jgizGtMxf5Vm
         kYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663918; x=1790268718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=jAw+fI56RL641y3iR8eUAoxMD02BKqZp0hVjczZHc+dttlKHWy7MftpWF6Ua2AvrCM
         rK8ovZKzlIRTOq5WsuPSDEIVGZl35hCqAq3CN+Fg7PP+OiQKcg8PwbPikoJQYWVba7yj
         uz/alPPgfE0oqf3m0IPVZxpkf5Uz97zdI71Syx3IqJNdn414KnaAi+h5avsZ/vIMZYl7
         xtrloC0rbcrLKx/S6nUzT8UyzYT6QVW8kZjGej9P839kALNdXV2KRl/QoL5mi16XPVlX
         gCbuUVzxLi0ACcNZUJB880OL0is5gHJEeVdU4shc8Ug+vH8X4yrqsYInSg/p8JnU/JJB
         5irg==
X-Forwarded-Encrypted: i=1; AKwUvBxj8btfpS7afqxBlmn3pYw80zJ9C6AkHpNYRdFoXhxt3LmBtrahX2g8uH20cnCGyzlagrw=@lists.linux.dev
X-Gm-Message-State: AFuF++kXWJNrJgEPgnriwmmk4+vl9Qa34I3YKV8ukKOb/ZwEeGwzfGJg
	a3xbw6CmFFKwi/1XxAg6PrOMCaTPxg1SxsXzr/yvvc2IxdWxeu2i0hXVXHRKowHeOTJNfcEXkSf
	xh6hI9ONq4NwGPVplFL89AFj9Zmw1/n0=
X-Gm-Gg: AYBFou2dAqhKXdjTHOUg6Y1acR53fEJHOtPslX/H7j/xJoUrudrUpzrLFhEka4vOVt9
	5I5V8mhx7bcjIMCxvCyn5MSdpg3HnpLv1FTMNDZx6yW4fPA7SbA2IoLyhHO+3ItHtY0azsJWuJs
	ukRZYjegNT4U8Kz6Js0rusJKgTCHWzHEh9tVgk92ncXUoJD+xDoVBNABPumHGhbRwMu3iVLBHsE
	EGfmov6E9WmjqYB7WM3UMrBaDpIMO4+X+E4M+gpt2qy4vIwYZ670Lhy4aaQAvklnr3D4KreltWc
	4ODnYI4wWsrIWaFIzLYHpAuvIsmO+lXvFZHEF7WPLZ6VwRyeo67vun0=
X-Received: by 2002:a05:6402:3789:b0:6a9:98de:6d8d with SMTP id
 4fb4d7f45d1cf-6aa2245fd0fmr5568315a12.45.1789663918221; Thu, 17 Sep 2026
 09:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902193351.185771-1-l.scorcia@gmail.com> <20260917143459.GA2348773@google.com>
In-Reply-To: <20260917143459.GA2348773@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 17 Sep 2026 18:51:47 +0200
X-Gm-Features: AcwNN1UCLyUlHms-nbsVMpe5KcLakQ0vi0ozu7P9tcFuOM-WKvxcQ6ubbojqdxA
Message-ID: <CAORyz2+rT-oNJtWc5BRDrpUjBPVbO6A=qrX_K+J7fAR5Ebm_3Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Still waiting on Acks by the looks of things?

Unfortunately yes. Patch 4/9 [1] was suggested by you in [2] and it's
independent from the rest of the series; it could be merged without
introducing functional changes, but I don't know if you can provide
the Ack for it or if a specific maintainer has to provide that.

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-5-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260520150014.GF2767592@google.com/

Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
