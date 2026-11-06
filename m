Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793952002;
	b=ZX0dRKJFgm0oREsf1HZ1q1v85EBbnxRBvgMW+3ODrpNyKOJau1tl6y4iwEEY8Ieo4X3+
	 5GYuLdGYmpTpGAUaMN5SAQ7Z7aY+O1/ajkL/a3884faotjcBCSFt9nW8eP46NSxDk1osI
	 cGVo1Cc6UlM/GTeaZRCbPcgiHQnPOCkjnOCukV7o9REj7O7ZxPJPFhMp0izjFXDF5cmDJ
	 ovcx87TvA8+FY/Agb1s3drm/f0C4GXHZsPA1An4Q0vP3O+lHd5oZbJ2KtUfgqQYk5ksIc
	 8LenWVYdyGnkpq4+dufdQWYfryVVj2glE4ddT9dXab+DixorDRiAr6s8nNKYDdSwDBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
	b=M2h8KRcjPocfxq79Znhaxnfn/p1aB/C6rCPjjg5/Q/MOWSezmXodERMoQjo338UEttdH
	 btfj4JTlXOWELS93PBcRyyqj0JfU6Q13xi2mE2lB27McA3zmn1SA90Cqa7gA+KBTswraz
	 PX1olPDsYb/hRZYyUx4qry8kJPNbSN99LFmNMFRB8SexWr1/8vx9O5Hr/so75cTEp+7Na
	 z86Gr93/MYlmK+BzjLKplRF9FJQxKVjHrLfG0UAQlD59Eazocmmub62w0mOc8B2hN4g85
	 G3ZmCo+NKXxSHNxiuSxY5h0fXYcvlwSzf3RoySuJAKmcK6nNsRsrLUVtJAXsV+GZBBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTIAfJMr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D46083621
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 08:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7D46083621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTIAfJMr
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so84665a12.0
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 00:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952000; cv=none;
        d=google.com; s=arc-20260327;
        b=QY9cGpVs4upcGubh6OHE0PS+Parl7sA4sH8eDI0AYVEm53iajCb+nzD2q/r4EnPvgs
         6zx+17arTog0iCpNcIaklq9qOme7VvSi95Rp/xJD3VmGabl4qNUezRFaOdjMJztl1WxC
         N8j3AoonAQXtnVN1UlomtJGTwbyZZvodMulXtI4xntDPxtce3Wv8t5CiYTlwDmvAICND
         v2wNtj5YUKIdGseImqTHb0F2WSm5gmiRNp7B3rQ4QsyhEYx7n9fTyM2V/O/J37emFR2/
         LCo3wc1SwGE1JJTMfPQDKGB/gpl8bK21YT5X4TrJ0JdRdnY8B/cYnENfcG+h8zlIFS3i
         LOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        fh=+ooNhpdAMoxLMQMCf5tZVELl7SXyuzj5T1y813oih9o=;
        b=UIyHuxz+dSyMrmlIQONsykfp9beIjmEv6ZcSo5tT+m+hjoDYO0Jqu8Gyfq3Bl9Q6Co
         LBFRPEoGmizrYoSs/RtdA8clYNxeHyHOEvvnPk+/vBdbm3mmWRKgmR5c3WhcGvGyGRm3
         ah0Unsq1tNMC/7R/xqEg/WkpwQwhOhIP+ld2BuBfvLplX2eR+M6pbDUZeHUFvoWjMmLg
         d35Sd3XckpI5uwY70jS/7euGZbYb/UMQUfrHGl9ljPEWvIculF7jX9t8jZ50eF4kloEc
         mzUX+sGoAkERpfGNkQJJXhK5zEL+QZB2AgAPaF7lekNBSZNeKzmbyl6panppTyI6QpF/
         U2Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952000; x=1794556800; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=BTIAfJMr719kPO+aBn/+vWBBqg09vcum8InNGYkGNkNHCwaXO1ObJrlJ04q6lciW52
         I4mepoMHq9vpKRPK4BxNEUEPudyqAzUrBo80x/PLwocIiOEYK8oaZJOZYkXM3JfDK4TR
         CtQ+n7G9eorYloLALVmgrgFOYp4PgQkjsmSJJhJ+Kcoq7gQM9C8P2ILbNRrrI4nckQ4C
         e7uhqOmb1t4ORWoSfVLMnw5NWSiV8l3rsvzi+hRGEie8DDc5hEXfx+GsZdficMjGxCuN
         fsE9NHfZql9qzIRqCjNcbbuSlwCYl/G843r4C+Q2CclrI1BvenNRCWIOwKGkHWE0pLya
         crNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952000; x=1794556800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=0fLVwbCPSivQGbrZof8wkJ7CYT+RLYSCHaTu+Qu3x7Z2wdLJc0zT6XF4xm5EP9U33V
         jaAG2vueVRcPS3D+WdWUBfFKnGngx5fv5BOzpNaCbkI/NcdpDxmNFSC0DVdxAYW9fcCZ
         sOx6bjFeZXqVTIboixhp3vL/khIPoDWz1BArdBmPVFH3NarPeyBGcEOwpgS3uF8XUdo3
         tvHhVL5FnqilxBnTYl1M6wfDwnzImQQaT/71meFsTRw2H/9HB+TaihJdViErEJ4WxWh1
         CzqgTHXu5UKlhbNJjx/nJsUPv7SS+33E6C2V6Orrg1she7E22clUpkjPTIrn5Kbjr8xI
         H9JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy+TXIkZrOSEDA44594/RhFyB4RywAbB9LCXxpzbWWdEMM8XJiLBvz9SyaLZgJEBQ1C3g=@lists.linux.dev
X-Gm-Message-State: APuU4Z/35LfeYIjI5y7W59qgHLADGjKRkOEZS+NOMDRlHjnEojCYeWDE
	myN1AVqHuSh0TDdpsk1jHK59Wk39ERJztfHB6M/e8jldBNPp1TdqlNERYXelDO4+6QKK5/H1XlT
	bldaeleeMCIc4WkoI0pGW8vaL3FwlfK4=
X-Gm-Gg: AYBFou3AmWqCoi2eExrKv2dWqZxS1rbF1q6ndWJTNjy42lwNKGomedMhNHBmKn35ex8
	UVxIVdI73i2T0gN+kAFETqL7kKrf0xkkP+6dpZG6aPqrkVYow1DIyBCxAGwYPmThcAIb8xn86F6
	f/eZg2g1TXDxnX5RRmmRqhj9zK2zM7PaykmLywV3krIjUZABQshlsavbhJuLpINffejDT5QYEtM
	NXtf2Z8pOjCVSnEg6S6YtHHDZb40kXA5pgilKh5vzJAwDZ+ECbGJ0sORgil7hSZKX4YwiYMnZWk
	5PjV8Go+mCcxAXDGsVed1H79Tk5WvtqU6+UQtq8gOxBO4HwczUYqknmqN/4/3+oxJ0RLXIucCEi
	ZYicxHnUwGmLq/nY8yaui9du3Fv+sR8X5QkJiHmnQgf7wK6G6ZVNqgyxb
X-Received: by 2002:a05:6402:440b:b0:6b5:9849:e335 with SMTP id
 4fb4d7f45d1cf-6b5985927b4mr1117288a12.1.1793952000065; Fri, 06 Nov 2026
 00:00:00 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261103150936.GB792264@google.com>
In-Reply-To: <20261103150936.GB792264@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 6 Nov 2026 08:59:48 +0100
X-Gm-Features: AclHuK_yxwIK0Nk7bFmyEO_n6HuxXT4AJJgazikzKXrXwadabrKuwJfTV_QGR20
Message-ID: <CAORyz2J_J0dYtg2BMKq9cuzo7U0j-cMQoFXn+2pOTztHz8dS-g@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How many more Acks do you need now?

Still missing acks for the regulator and pinctrl device. Yesterday I
sent v12 of the series [1], rebased on v7.1-rc4.
Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105194426.1113050-1-l.scorcia@gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
