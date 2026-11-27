Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771321;
	b=Az4EZc+c10IXJ53Wl4ev3lVOgvqeLiwzFyVZw6dcFMU682FZkzs6X0Gj6+6EtDQ4Wz6C
	 hKMKHZliTPtzbMnQpaVneacIdqS+aDVwTDQfdgUcuvL/XIKlP/QZlrL59mHKRrgsNbiZW
	 +oJCmdLw6T/hkTSTP0mKfgQYl3j4t7D0ihRuBHa8z3VMDftXbu92ipJEzQIKnXdTP546g
	 +79v9XhZxgXYVLwQ64xBaxU9KWWolnWUqMG4s0XDLUz3mnFaK92paemvyK/Vy7lbhKgwk
	 C952z7cdMa4HpYyIkxEKydD9QM8HJm5/dht4cyLOyXyAXypQFFdxeXvalYejp6SR6xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
	b=10MVzhLOEQ7j85f5QTb6GaKs+yJl5I5j9x9ntwikwBez3utvuWwOiXDQW9Gw4cav0Y3j
	 52zRp5+fLZgnCCi5BmctZhm3XEzm6p9grrDjkHcwHSVo2HXvoIzzeeH48ndLMglQv7unl
	 k5Mf1WyMxCfccMwQKacRRKBkCJujdileSvUPrpRN6AnTR3PwfRnYyvptH/9h9AgdLwB7a
	 CvTsnp2XofYsUycMzT9cutI3ozWrnjUHyPzgyH8/TlSys/rSn3C/qXsyMlBgBz0FXlssF
	 w4CGLWApHnn0AzgOjHUeOtZpyDSgdatfRPp42BBIM0ARZD1pSMzNBzstXPtWg1Vb7ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dz8ZJM5X;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018F606A324
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 09:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A018F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dz8ZJM5X
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso72139725e9.3
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795771319; x=1796376119; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=dz8ZJM5XCpCYBIqRXMSOZvrcu/6QC/ZotyJmJ5XxeWUKVMQ5W82zuJ4LBPGVqb7VDN
         HFp8aZRiodnONJJoaclMWeFslc7mlvGGh7EiSqvzMllgTCAUoQLSmJ2WZdm8uzNM3469
         misosnivkLYhnHo2NE9inAf3NrVXGiCPkcU0HV1ZxcT2w0eijz1dpLoukldZ9R9mRqhx
         p4JtqFuviQxkH+LBk9b4i1+MdOcU06a3dAeby2HBGp06y4gxeWQTByGEkplKDAhyzwr3
         lpx5pbNEkyR/W1ypARmT1jnrp2DCuuty+nKLZYEZ99B6u2CxMFsIDbgurwkT9gQ3A61V
         WExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771319; x=1796376119;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=QUGLuIu5vyjk6kbXqKNIqCplzTwBtA2wV21XlHBrm8/RnaidUtt7iLLZOhozd13tiM
         q+QXZFvUH5a8MI7qmQ8ouoUW7S0THf5vsE7eP6gq5YE/YviMw8NB82/wIN51BG26z3al
         TQMeobIbFcd942h213QuZkjMv5xbaKP2RXtALZ9yFK+sBLqoezdP49z8B++EqXTOsIVF
         yWFxYLLWZaD4AAf7JfVS48awNTrnzFZ5Mi51p3rO+SfJYkignlfprpPWxN6BAPECWodi
         0NVtqLbHAKnsOiPbkTiux9EZhvDpf43vxuO4xv3OAy8Q6chDKlXDZNE21F5E4Vh7N81d
         P5Sw==
X-Forwarded-Encrypted: i=1; AL+hErESYgE7eidQ8fDjfHEK+t5hROS5afO85aEfbt5os4r76bJH3Su719sH6Jk6mmoqQZ5npgQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8UeuLBbwr7tJ7HXFa9vF4IO40LaVE1AjVEben3H5wthZHpM2xn
	sEtBIoCa22164eWnu/LDD1RPFTw9+pvKEeR2J3Ry19XVnXnpZOXRth4FF82YRrtOyb4=
X-Gm-Gg: AZFdTZeZq9crcLRbtvsp/0zFPF9RPqqYv73YJdat8ENxwQJ3SFiE/JAzKEqnAJ5J7il
	xVsoM3vZFN75Ex4WOrpV5KzilxoCc0NsgpGzSBPWmsv8Bzkvpo07dvGSCty3kGM6EZAeVPqk4Ew
	SefDWAVTmbL1XT36NgMVuSBRnYdc7W19K+f/gt3uDMcgAVFNIm7tK5m4D7+CN7OzNRf7ihzwGT2
	9udBHBj1Xqj+sJVL+KXY37+Iv5bEQgj46LkHRw/uB7jS8uGPhWYE8E+hLWl/DxX32Mdb8XnShJ9
	+N7RSLfDosUNAOrqru10jFvk1WPQve8vch53IVHoHkqA+FjZLByvObCp8PaYAc5pwgYhY/O8wu7
	73TXD0VATjvrodhenOyaxmQNWsUqByh7zzUTLi40iZgZX4nX1bWbra06phqa5RHWmLC67ZZNAym
	0v41HUxGtYxJ2ENxirwv80aNK19fYJ8VsMNoWsb4qjjxn8OTksptSTwA5md4K2wPhksNsHH+++n
	anbMKtMXoXDHGWejcLZE47oVRrlRwS7dbt38P/vkce2tfL/trwcSjRnlmwJUjTt+5Rdc/yoAmqA
	R7aDg8ePAIXraFUmBZBlKwAYnS3m4LI1EUcm6oKxX02A8Ael
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr538864655e9.10.1795771318996;
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm741305005e9.14.2026.11.27.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
In-Reply-To: <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
Date: Fri, 27 Nov 2026 10:21:57 +0100
Message-ID: <1jzeuu1vey.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 27 nov. 2026 at 08:48, Lee Jones <lee@kernel.org> wrote:

> On Thu, 10 Sep 2026, Jerome Brunet wrote:
>
>> This patch series adds support for the X-Powers AXP318W PMIC, which is
>> used recently on new boards with Allwinner SoCs (the A733).
>
> Doesn't apply.  Please rebase onto v7.4-rc1 and submit a [RESEND].

No worries.

In this cycle, series based on -rc1 and devm_kzalloc() in them tend to
conflict in next. This series would be impacted too. I can rebase on -rc2
if you'd prefer to avoid this. Just tell which you prefer.

Cheers

>
> -- 
> Lee Jones

-- 
Jerome
