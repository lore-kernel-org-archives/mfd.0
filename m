Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371459;
	b=YMVYkwKL8qiiUHlrzFEwq2s3S1AuFaaK5iFlqJ2sWiHFHVfaMIVOZPKhl0GrIii4kJkX
	 nYRgs7L+Dlzey4UdM9AwuvhbjnjzwFVWb+UsmFc3nZf9L/xaeICfR+SeNWGLMvg9SS2jH
	 TGM0Frj25BHZHScHOLfH2cz7nJvxBK9Vz7Ns8L4SrT3IFNqmQx5TjHl/q5VxdKGkJ0dWn
	 MRAxhrSE2NPqQ03YUCqHRhHBApXithKLpHx378q0U4sjxepKc47r//1VR4BhuFl2sZKE7
	 c1k2DD7WOQ5Gz0t90/EsyXopoZsEcocLtTIu3z5BlD3Ms+k9QgXzh42cc6PHxDbjD+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UtnA/zteumxQwftTkhrGmioZkrzpjA4GBLPRv/xbLwQ=;
	b=rHXBfRpyuGfDsQBsQS47XSlsJImWjNpdfzFt0AISERATkAZCKpz5W2AOtZkMiHrVN+Nn
	 wSJ8LL9RU0tn/tPO17JGYGe9Z0diVsFdOQAL2yeHl/1dOC/UnVGbmv+eXXWsZKkHMr41P
	 mogby04Zj5eubw6x/PLc1BkAnCxr1FZhRZ5AEnxbGBL4K2onU8L/fsh4lA56WRaDtIqYt
	 5r1Nb1R+ehNzgqXwrQA3jbBKcrj/6lFUyn8rRo4tCuzAU9Bm3WIebp1iq3P1b6JZHM2U2
	 QIm20JwbTqg3vJ06fXBUvz5uGIkU1/oiPQZp3MG9q1r5dMhWPMjosUIYEujaIxRoHfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwY3fa6J;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D9606A320
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwY3fa6J
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so103379966b.1
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371457; x=1793976257; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtnA/zteumxQwftTkhrGmioZkrzpjA4GBLPRv/xbLwQ=;
        b=vwY3fa6JeWPHq/0HrnKX2ulCYiHi/goqBwz2cIlAW+Qbf5BZnQ2thIMRltomVFcFBE
         ccJiJKqNQ7SpAzHhrHaEp2KHG1za5RTtp2gY2UQ8youq6DXOQXBppbKAAV5KHlMW5qyl
         H5zcVeAai05RYi8NgjuK3w9rGKZCHKqDoFuoSOGN91Q7lCCl5XAt/9222Jm253Jp+C5e
         G9ZwQHItswtMIWwzfxL3m7w5u0k8IqFs1YVlVb8RGHK0JXzJmKLmyJ17B8uhd1cSZsro
         AjCilReKfiXgH7TTefA9v6hOd/1Gwx56uxeGq5xiXwDtHnpG6Sp2M6V27IF1fG2vFY6I
         KLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371457; x=1793976257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtnA/zteumxQwftTkhrGmioZkrzpjA4GBLPRv/xbLwQ=;
        b=RiT772T+eNwm3MvvAuyt1PEAsJwcKPI540LFKiaxSufpqFcCrSaq1CdMH+99Fiq0Q+
         Thi4tWpanw7a9XWe8Cu9QNmFZviW0JfUL3ERqPF58Q0W3GDd4omNZbIFP+StWUi8hkPo
         Leav+JM2iyhiy7olFChHXCMlEuSIjl7GNT0HEG7bnehtAU+Cw8JimMrYPSvD4cab/UqS
         AXb7Gv+a3G5cuq+H3jneuOWIGzk1x6n2K1c2I0dOX9h6wHyqu8zyfaUBaS4VWUobrvhd
         8TcFKb9Botm1PVcYI+9T53mC1je3HQtuhV191Jfn+c6hYxW+55yfXnner8z/ETTeY2Mj
         TjTw==
X-Forwarded-Encrypted: i=1; AKwUvBx5hgom9A3SvCvh9VmOjK7CdISXuQica5Qrep+gznXIP0KNKmDuCWU3DfFqqAO7FgCXoNw=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRyGb8F2UX6t1sisAFTy9ZtqGXnX7je8n1Ez3Cd8Ch9aPguZfA
	Ae6gfZZq34eaabO8pmMua7mJ5NdqALw1eiD59Q8k5h/9WKnidxnf1pNp
X-Gm-Gg: AYBFou2IOVoFs+gjrYRckLpVJLFuKBbPy864N9pg+62eVR8XFDvbJP1ENRbA1EPJuFV
	+lESXPEPRhSjoNxdBw5m9pA9kXdWJabN1y24/TY3ItU3HAlyG33gvvmK/DxnkfaWbphaGyk27fn
	CQlSNFgHCHTMPbkeyfcKGQGVJX3JpNhEenfa1/L5CXzEvCMerm2ZxPcz66gcue2HY9q4IJem5MM
	2gPkJ5oo1IAZRFeu9RVstrfVAl980oT5d96hYiMDYbP+488EiTA4ajZrl8b30Y1a22kcEMod11Z
	0VxAMTNhaX/IXEhGhD5IGwXju2scCWIqri7LQdhyZgBt8UmLa8CoaKnPgXOFdJOCu2ELEBq7/+L
	9/UPuCV6c30I0dh38hNVG2vfn2CYWjycoxrg3VZDi+0yWKFZFptkiIX+KZCp8SRTG6yaU+1d95q
	1ChB9Vdk/Nujetl36O0zgVrobuPxS8rjNOtHwaEb+R68InAZ0m0+TIjAU/JsdXAYdE++KJfwAUZ
	yBIE72AuOlo+wZhHGE4lxyDpmlhY9oeMz4tcJlNoIgaI8ATRwx07fBcg0tMs/rWvwL/Duf49HoR
	nmpGKYVYLrWKwDN288TwkNjaiJsMObiaFiHELTuUy7zkE0oqVb/S4YNTYpuAqfCEnouF2whxWqs
	=
X-Received: by 2002:a17:907:3e0c:b0:c37:c0dd:6642 with SMTP id a640c23a62f3a-c4ca7ad13ebmr240192666b.37.1793371456921;
        Fri, 30 Oct 2026 07:44:16 -0700 (PDT)
Received: from [10.142.16.156] (62-101-160-75.telecomgroupservice.com. [62.101.160.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm69844266b.64.2026.10.30.07.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:44:16 -0700 (PDT)
Message-ID: <c18fe7d6-c738-4049-ab88-c12817f0108e@gmail.com>
Date: Fri, 30 Oct 2026 17:44:13 +0300
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical
 section
To: Eric Anderson <ejona86@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261029192223.462367-1-paskripkin@gmail.com>
 <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric,

Eric Anderson <ejona86@gmail.com> says:
> On Thu, Oct 29, 2026 at 12:22 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>> SPI does not support atomic transfers, so it's dangerous to call from
>> atomic notif chains, since it can cause stall during reboot on
>> orangepi5 (see trace below).
> 
> For my curiosity, is the hang during reboot/shutdown random or consistent?
> 

They are basically the same, since they both trigger sleeping SPI I/O. I 
agree, I should have used studown/reboot more consistently in commit 
message...

> You are explicitly mentioning reboot, although the stack trace is for
> shutdown. I'd have expected reboot to have always been broken for you.

Likely. I've just bought it, so cannot say if it was always broken. 
Based on code I believe that it was indeed broken from the beginning. 
Also I've found previous attempt to fix it [1], so looks like problem is 
known for quite a long time

> In my change I noticed that reboot and shutdown didn't agree on
> whether to use _PREPARE, and my change adjusted shutdown to agree with
> reboot. Since you apparently need the opposite, prior to my change I'd
> assume shutdown was working but reboot broken.
> 
 >> I don't have rk3288 board to test. However, I strongly suspect 
that>> patch does not affect your case.
> 
> I'll test it this weekend. I suspect it would work fine on Veyron/rk3288.


[1] 
https://lists.infradead.org/pipermail/linux-rockchip/2024-July/049312.html


With regards,
Pavel Skripkin
