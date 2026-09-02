Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B304AD4B0
	for <mfd@lists.linux.dev>; Wed,  2 Sep 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378050; cv=pass; b=rR9H7EAchLduTIN4k2Ut7zM4SCweqz/1dN/sbE8JZSFNWsisq6/oOxfErPrpFj/VUaABM6WH5cgXPYsS/lkyy1eh0hYrEB4DnKdzGEOEMFWqNIWFjDgN1O/O0caOdSVYtOSBe63aid1hrFeoEcMxgwWHfdzck77U7rQUu9b7N3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378050; c=relaxed/simple;
	bh=eLHTLx0sDJsJ3UdAPIBmpFXK0Itit+qS5fZpvv0jeas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfbkoh0p7JQCEz7ZFH+/0fO9BxutHgP0HWQQgvkSBsg9/GTBtl3wydejnOehbRhpkY78OuzMUngCfQX14ANW5bTqceBJxJF9Y/All6sxo4ZfC+bNIg4iRAOIKDPUzGdibYHyJcupQyIqoNJq+TjnKL7itNfKH5SOxaZIqHxoqkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1d1nFUS; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1d1nFUS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c259e5c22ffso244435966b.1
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 12:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788378028; cv=none;
        d=google.com; s=arc-20260327;
        b=WXH+awuOrFQmJ9P5rwemMqx3vHaWtoFFGE5xnF8Gv9mPLT0Sov6Otttyo2eMVsKrjW
         DmiO6LvXpnPcsR4QkIQRZjIsLA1ABbJ5o7HYCKwh6jxVQGXZabrD3bkId4jgk8kL7KjJ
         1UI/ahYQNe5hLbvbXQGk8kibgXp1w3/8AOS21Nfm7cjAcMKcUSXmI6ZyYfMLB4BywZ1b
         Gg0Nn1Zy9MhIsg0j8IE5OY9LRjl/MlxORc0oxKW1DwXPo0+WEkrDUKbzi9ZAjJjAUtgg
         4zN4xzM4ENLHnGiz13TdiMBRAnUbsLY/sF+rx9tekpCPA+7aYPcTNacFgEas2FoVA3JN
         9xtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        fh=R13liDKkxliNWFhtHrSsZMCMPDs49KFi5L6wpdfoXck=;
        b=fxOnsxHmmVYluK9CFOCF7IYzU4bOqPXES1UjoXECdGnz1HITwBjagyi0y2EMCGUPOM
         RIjxSbhGGQTZcXAYMS69zkzGsEKJzlYka7r0VqwDjIBbR3xT/CNZSasCVoeiuAa8qOmP
         Si65c7ezaV59HrLjrn3V2FSjLL+iNtrhJNilP1cbG4QcIC2Pc8AMqAba5flCzJ1GHN5E
         ytfkPp5mC54OZPOdnMerNeyDaSx51iWsyUesUT1KNTXimLlg2XDkIDr+C1iOFtLcJ8Lg
         MPi0idixnN5C0l+7ul8jeePXp8B/i011hTce8DNAA5NYla20lsz4Xql6KR6U0SNDQogP
         QqBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378028; x=1788982828; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=C1d1nFUS3nPTn+93p+hNs3Qm4T+QQzHbKGhpFZ0fW1q3IvAsm4W8GEFkykJo1DPuoF
         kcewgU5rkRwRlfTUKQNQzMk4KKV0bXZVwMo6pdoLHrZhHUUWqmzIXk+CW3wjacCpttIY
         ov7pqJtT5Wv7GB0L3PB9b5+brL34y2zz50EC9LZxYpxnqd4hBj1d5WnN6+eeTbGd34u+
         dWYPpvFb1FySbp9Jz6iGmUPc1YWAcr2elSrgcj5ZKTc/oTuizye+eEdDfLvtYi9p79oI
         8nAirPjd8F5TlNt4GSVSQ7PayspXpKo3FqQ00LFHmATbM/oRHSJZyBes0FDfWW3gFHkt
         m9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378028; x=1788982828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=jFYsEL8LIWriBsYT2cWDLYkDw/ZfUIWfKJMeXkcnLu6mFmanJ9+kGUUjsHpAA/cPb/
         IDxRCY87OGIlGbqFKHoNv+/7OF9DWZoALLq0W74beJkeeMEgM2ZLlPsr895sATDad4W5
         9FhyVhm1SvFLSL4S5g4+h3dlGf41cif1hBThCfSk2/T3+iwnEwERFLet+Ngv2amm1bP0
         BOCM0J1N/hz4pkPE3TnMmayN5MRGEF9raG1yUqkORMot2DEzDwlrFBRUx5M1pa6bGaVX
         b5fKCTVORhPJAcn4gIU+XUzgH0X34ZM4GF2Tk2PP2abtPLvTGMMoPNp1dT/2Xa5j6ce+
         EotQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpF26KhZA4zddRzEJHBsl7nF3LpwQiQ5OSz3miO5oMQxO+OuVCUvYp/Vb1L2l6VN4wgdM=@lists.linux.dev
X-Gm-Message-State: AFuF++nEZjfdqZXjlRemMjxhyVIl4ZK9RzYLdD5pJ5jZ0lhXPpmADrtd
	5+/OpNv3siePZp+ev9v+u0qB6eyyvroUuRJgiZgV5sA2R6LFgJDLbweYcbCSTeLOoOvUFFEU/Ws
	3Di32ZxRcXAi2rKOxAoAu+5vSEcugVSg=
X-Gm-Gg: AYBFou1QgUvL14d5xEOHOh5n8QWOQsYm0MSwZn2LuY1QZ/0TK5BKvguO8cgVXfc8vy6
	/HS8WG/9P+Wfu+D2f7tdR0iweCRmTJgNvYTJQDX+Tt0rP1O1T1kcOFCjJljtiUqbHn8em7/uOnZ
	k4nMjlg7dBh8l51jV9rqIxhFKuoqIp0NS5Z0/RmlpcToaYbrdgF+gZex8VxFOokkI/A7hSiWJiG
	IiHa5RGDpsZJx+LeyAvWG3bArJKFegIp/4p5fPqYU9gK4QdEqWL/4/NsLH1WQar/GCbz2V3+uNA
	8gqg92WlcaCP8MK6cXwllhTlYRnKurDqKNk6wAhF7Tk=
X-Received: by 2002:a17:906:6a06:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c25d53cd18bmr358830066b.7.1788378027879; Wed, 02 Sep 2026
 12:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260902154616.GA2133376@google.com>
In-Reply-To: <20260902154616.GA2133376@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 2 Sep 2026 21:40:16 +0200
X-Gm-Features: AcwNN1Ue5U8Nrt8IK2CbOEno4dpAA-gcYG8T0qYRXxkQ6nYlNe8G_uXeI7qiNIw
Message-ID: <CAORyz2Kt=rKSJW0Q9pFJiBsa6nPGhHdNrsTsHcE4Qxpq5RsSaA@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What Acks are you waiting on?

Hi, I did not get any Ack for the regulator driver and for the mt6392
dtsi yet (patch #8 and #9).
I just submitted a slightly revised v10 [1] with an improvement to the
main mfd binding, so I think it would be better to "renew" the Ack for
that too.

Thank you!

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-1-l.scorcia@gmail.com/T/#t
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
