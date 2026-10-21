Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566394;
	b=aGorWhLLRu2ALVFLXEXbp/bG9HDW8sbzuuysTiRK2F8t8LRecnqznPpEwRRjVQUwDw/+
	 ls0Nf10WGiDRdOca43Tx1eE0csmestZTitjy7W/XZtjou5r8/O5Q7X2hbgMhlDmwi5IfB
	 0mwIxq4gsLEWXGsLROfGPMkOT63pWe3iW/aOlTSf2ff7OouQ8gZVGslbiE1ylTSUz9gCZ
	 TG4Mqtms2N9XTIy4vYoo+fR4m7tb26e4tx0gk/aR1PpZNTKXAkS4yV19o8WKwq3y3n8IY
	 TzIjMa0+X0fRiNd3eO+Ijgewu0MdnLhojgdZ8L3MBhXBSvyMydB6gXosQLe5MbpWOcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
	b=TAvqszpZgSRXvW+ZmCSjHNWgQuqU7ZUDvR3Syztp7aZ8TrqLr89z6dXuqQC0MCAgRu2a
	 hh+IudaWvyd/aGjQIJejc/Ikh/WrnFH7e6I3QXYws6/4jZqGR7SRTNrnuB0E138RePbTa
	 KTjA40NOTk/9UkAhc2dSB5fnfo9HKz3vk9278IAAwyYHStQ9SYNF6abdhstKqvvCoP+Ps
	 EKHXOOeeVm5a5PM03LLizFqkVdxDsJ/VCdYCub5nbMm8lXlEHceoLTiT9+5bGue9ix0+C
	 kuPR9ZiVJnQoW0AAqMVRvTq6JpaSXWEHskBbRKtPP3NpvBFx7Iokcncfzib49YhlDHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Tk/qLcxv";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2753606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 07:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2753606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Tk/qLcxv
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso442138a12.2
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 00:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566387; cv=none;
        d=google.com; s=arc-20260327;
        b=jlihGZDNMdH3xPP+vt2aXSMDvaQEaw5apZwAQaEEEuMG1+SuYnl7GT8PmTDJW5OwG7
         1/hP1/0+eptqMhp+cBbadzS+4f9+CVRbMxAuox+e1ubNgftmXwAP1oqw90VrusHes5U1
         8ItZHzBasGL7D+rYW5zZe7+zhjhlF9X9XLfYxc3nQZMQifeyD6bM4bfLlITd0djZd/yV
         QHfWusHj5+4cq/5VEFzvvS6bNzOhdQnkpeobKNTBhANyObMFs5sTR4HY1hf/xtXD1ym7
         b7h42dXeIDo5Y7pej7LknFSn15EEYwJf+Rz2Hg0AuHll9KlVHsBKduWI6p9qhp7K2TA9
         VcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        fh=z2orGtU4Eb5r4D97DAhNhPJroEjFvCQXk+I5B4AbXCk=;
        b=K5kLmcRSlMR3c2khCnfopma/RWXH9PyjFIN9C2uU9gDoRMuYgENF4f+c7T/NOxYsnv
         Qbcc5mCXbeNSu5U2sfgL5quuoKpgMoHyCDTtGYlFNr0WuNJHSDa13JbM4DdF8mO+7YJ5
         BT2hoUUbogHnvVwvqO8w1MYJpHLL8X3HB0KP+9/0W6c/do9gczixlXFg9878JLK+YMyg
         z8LzswESJ4fLoqk2EjnBcVGz+FXtVAu2s/phgnJ60DnNq3KoGws1QT8r6HyrD2ZQPgOS
         Fh0kkgrwFzUg+fClfPScJyTb8WhThL1gyn2NcG2mJeHlwzuzgCoy48/d7s1eKdeb0Ggb
         WmSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566387; x=1793171187; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=Tk/qLcxvuNps53FRmmWpnC/74K7WWL4KTheDPkQTI7kDNNNtwdRmKEcIkxp1d61hZS
         LXB99qbcf5UveJM/FbRFur2YUWWkX0wrsb9e1APienkEahzLI6/ZH8FeG+OglybBjfOn
         6RIATFHlCn7xS4p5seLsMiziB8pX6cd1LqvjJURDa/VjKhtLGIrEYiKgMTm9VRmE1r0U
         qEhXYV8djxolTvO5ruAiOcZwt8T4+N7gYzHkKze2iz+oMu96t84I4OCHTRd81iRfhMz1
         HhYDJKS6DR5aYAIqUlGJzsfoUpj0WW/Dv/Zr7v5qsqEyKdZtPuO9C30SQdjClYCj/gy+
         p9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566387; x=1793171187;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=aXpnaLa+lCMuA1rJZZAyG4aGFJblj9UxueJhfqk4jI1ntpo5UuKQFeycUKMLQ+Wkoq
         oTXvOX5Vrgh7k6B9wmmXmiJa9YWz7HtWC9NL0xtAq1tEwOBesChC1iwP7l7BeWvX/hik
         0Tp+1G/vV5bkX2ujmq+dPJ4qh3fy0kYgb2PEoQSaJNX6fK71PLNdWiJQXDCMEtNVo08F
         BCTW+TvudxbV6JFbLMeDy93MgIyuJYCqhX6gnq1lM79ck413qY97/GTjKhHqOCQcsmMz
         MGxhUz7y7hvDTd0VR2F3BPd1XVNea+mZll6fexrA8SyeYEiNFI4o+a8ormpT8X4ZprV/
         URwA==
X-Forwarded-Encrypted: i=1; AKwUvBzhslSU+b9zxknxmjbzHPLp49SPve2NXFtPnoJwNr/Dn795wbG1yRL/Bw5RHikzc0yjFVA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIP+OZwlEqyjz7R5tVyRAUaGs0shC2yBT5yRRECSWZ8RYYu4Vyr
	wJ4etWPQCUsTZm/2Y1YC0jvkWIta6kT25Zuh7MT2e3mD6xbbIPTh4BN+ipkfeKPc7YQT88ZRNPG
	uQvzJKntnxLd6BOdQhhDoolkP5KrWbXg=
X-Gm-Gg: AYBFou1auqswMt9ptfRyRq0kk/kmGcIqC5AF953Xb8Ccky8wL+ALXUVIMVxnIgJfmlz
	kussADzREp4xwlLQkIkAuLTpHqHNF5hBaFBSS8Hlv6dXElb2yYAY2fOO8X4SajSTq0BJSTZRb6U
	AHBiP6VzVa3MW0pq0fL2LWYixHP7m9902/tmHjpIZ22wrSI63ebxZmVylQmVH0doyGKE1XOaO5Y
	wLqXUMtfR0ZUqZFABzESbFdVX35Zkb/vK8PMc8ZTdPbdre+cxR/ycoiKA6QMmSLEHBmlYkGlEIt
	liyFzdbGezqsk/YIZeCUCk9hWwJOPBh2017oJTEI30YjOgOu3RlxBrIvttjWVVLAsiFJozB2liS
	ldwoiWTNHeMZiOeWu8NKqquz7xeXyim23gFo=
X-Received: by 2002:a05:6402:1585:b0:6b1:cea1:a011 with SMTP id
 4fb4d7f45d1cf-6b40893d0e9mr633902a12.0.1792566386899; Wed, 21 Oct 2026
 00:06:26 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org> <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
 <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
In-Reply-To: <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 09:06:15 +0200
X-Gm-Features: AclHuK9050nRGHSTN9753pi8bjuF0vHRU3cnUbJida-ygLIdS4pPdAAtcMwmgKA
Message-ID: <CAORyz2KsozjmcDCd+KVfvLokuxs-YAP0E5yJawHECu9pbPQmKA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The dependency of this patch. This one uses compatibles defined in other
> patch.
>
> Just apply it yourself and run full testing - you will see notice about
> undocumented compatibles.

Thank you, now I get it. I had already removed the example from my
testing branch and removing the example also removed the dependency.
I'll run another round of dt tests to be sure and resubmit without the example.
