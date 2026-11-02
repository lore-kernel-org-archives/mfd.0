Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630193;
	b=QJEXU2jcpsbbMgKfEAGZvXbpNPm1Defz2H96zK7UNNKSY3WsM9nw/cGcmKnuUGGGqSUL
	 7IikKfvDg/aNUS0qkgNqA//uOM+N1lAUuEVJ7YYN+HoXl5KAUZVgAsAlfuLOUAk6GPD+L
	 csx4FncwUlLsD4dSbPCN06eThpZo3M4SYfCaZ0YnmplTlNEnObxaJgLXLG7xynbjupnAV
	 60/teb2TurXBk5mMwzoIcQH6qu5rxHjAZIXvFwiqg0iNYRWS/L1p0DmuoPxriyiiVzN9y
	 W79a0/4JlBi0PZjRKpkmJ3J8XTjGLivuXIVSvSbqgLxYOJvPCnxIGDgS2Tl0DMHH4dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
	b=5NF1yEew1OYlZDCig1FK4EkzN+t4tCleSmCExJRGXdd7fIsTaS37rRT4y+QfY2ftfwWl
	 yb7ichCMIxAJr9YPXXAFIOpfatt2dlvXl65i0wgkedxPepOtGqJe39Ef+gWumbcybecZS
	 4a/i7f3nP9e/lf0x+3bNJYHLnzC73tqsxUiP2B8Lu+7mY0v+osnt1pZBeMbiPXhmfQmez
	 o+T5RIqDWpsB4HBCmxnu7OrZZVkxz7NlG+hGrlqmbwywRl8hIFYcCCQd6nuyEK05EhdxL
	 o+cJMtNfqIE4jjxFd8AVtrKtn6lSqK6QPKOOrJiyLG9Hd7VvTarUxytEtf5ql3BhU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQ4y2Wdb;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF62607824C
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 14:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF62607824C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQ4y2Wdb
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-843c8bbfbc4so1374918a34.1
        for <mfd@lists.linux.dev>; Mon, 02 Nov 2026 06:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630191; x=1794234991; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
        b=AQ4y2WdbsJamm0n9p6Qf9rIRbbGxPTyGT5E5+7x0uGnaN+0FqhHLPv+7iVEpFHBV/s
         xWpR7VC78TeC4LYyyGSMtddugFtZeTj2AF0KwB5eDqH+XG6q5uEIHX/zSxc5tg1RqaOU
         t2svt7MiJv1QERTwnNSn4SGMxNq+TkeTX/Jjp8dClOuVuJWBtZ/tG/j1nUPzQWHVtc7z
         P7GJEABng+GYLasyEB+ePCSNb7oHMFHqjQlfewwCfSuYF2djh3RsszMWcrQoJl5ebPq4
         tdg2ew4yb1hfgOBSn5tAevb8qL2neURE9hJwj/mPWkUBrHdhqtKkRfpXYs71bmwdD04P
         WJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630191; x=1794234991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
        b=wioML9lNnkiOcvOxkL6oJGlJMhb0L1SeiyYXrXfFOPa5jNuWYK4BopewyD0sCNOJ9l
         nguP1Mysh8QppCqOobF0swgm/F40tDPhdDw8vdUosMihaK6voNERq5aFowo/Ajw4ul42
         GLxL2AZd2XvWWSdQXU5Ss09aXon1iXhabzg0Z6uoWWG6OyFzxOtMz2w9vOdNexZcBvYY
         20l84z/pl2lHHGP1Rq3lDkfnmaPruqkVZ6PVn2D8gtxAxnnGoxyv7rrDqBRUa9u06olU
         TzGENcso2dApuTKM2HtgTnwcLT57nv627iWMkQXEzB5gyQ6+GCCUvLj4nUav+8EDRzUK
         /fcw==
X-Gm-Message-State: AFq9FYLEOn7S8PrZgXjm3CK+WOcB4VlC3+rOasm7kWflMPCFpr5TgCDQ
	ArYACrbOZLOO8cpoq6FuiqnTanQa9tKZxuhNcHka6g9sV3wGnYGhkLYp
X-Gm-Gg: AYBFou3VG1j04GLHrAaln4EKWb89L9J/q7bj3gd8c9v82/bIC+DV8ARg6W09w7dUsw4
	mi9Y4RJPF474rNrZC/h5CziLizuzI7av0qVtI0glw+WeEh20zerNx9L2TIepOBiwtgBi8BjB76b
	gBlxm/KYJFhBKxMA7CpUoYxOTb9H1ISGqvsBDkepQr7aLNihpGkIQG0Dp0gn8lT/7ZYuUpp8sLm
	OkhV2DAZE1sTtx5nQZPObGyuI1DyFpRIZRQhVEcp2r2o//IOPgXi/5PvTNOERzQ0PblzNM8YqTY
	7pmnJEJefGIPPvhk399Lbr5uvvgOc9umMyxEvWZOkLaA8mATexSNVI3w3ettX8OWiwxtbkTHO1J
	920ddkTw2b347wz7p5c1rhLU5Gj1M2BgAwQSoZvnkaZHqpwEGYzih7O0AWKIg1mvGc/w9S4hxvA
	wkwekaAc7IAG69YOwkQY8fyGGTfu4lEojSXdtpg63qAQ4eHDLZjqHe48O0QEvMGHsLL1lnESUxw
	o1oZWmcivuOSKxflmPD0wPFFiTIWST/Nwfye7NyCYsprdNyrUUdxP7xcxbukSRwJbzbmdWfaouG
	Wxavx6T2fGXyzeD5Z0DczHw3F+gVnknjhPcRFQrBpWIY
X-Received: by 2002:a05:6830:82f4:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-85d364871femr7316643a34.16.1793630191638;
        Mon, 02 Nov 2026 06:36:31 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985b2sm9189411a34.11.2026.11.02.06.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:36:31 -0800 (PST)
Message-ID: <eb5b989c-0308-4721-b55e-4f179b8f13eb@gmail.com>
Date: Mon, 2 Nov 2026 08:36:29 -0600
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
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <sashiko-outbox-192928@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-192928@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 11:44 PM, sashiko-bot@kernel.org wrote:
> When pdev->dev.of_node is NULL, of_device_get_match_data() returns NULL.
> Previously, mtk_rtc_probe() never dereferenced rtc->data during probe,
> whereas mtk_rtc_register_clkout() now evaluates !rtc->data->con before
> checking dev->of_node or whether rtc->data is NULL.
>
> Should mtk_rtc_register_clkout() check !rtc->data (or check
> of_property_present() first), or should mtk_rtc_probe() handle a NULL
> rtc->data?
>

Yes, good find, my bad. I'll send out a v2 fixing this.

--
Ryan Brue
