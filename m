Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564544;
	b=NATFj67QUfG22jkF1fTxE2Vgw5xewJcNZpaz1nnGsMseinrAUutHC0PCn6Ul5/jktIY9
	 Bq6mXA74hk5BhGNyNNHNUwTricXlR7Gae+atnhgKggMQOB2wAw2X1VK3WJnhIZ7CgU9I4
	 A6SW2rD54gHSUdluEh2beueJ5Nj6IyF0vxG/QoDS30y1VoK4giP7iQ3BiA7NersV8aKeA
	 ca4p6k97JNSfVruw/gG7dyfuFqjNysrWhQKqLcOhrfIEZAvsaasoT20l8cVRuVxK7nz4Y
	 PZCpPbXTGtzU8jMhuQvYX9+QXTwug1/bHfx6vWfyTbxaIqdcNsVLwktgwStix7uFHIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
	b=KxnQNDRKTWqvaA1aKBqeR+B7k+p1QMrGiEkez0L48dRscW0Z2Tv5dAcXFXb0biJpAuQY
	 2ylfGr5qub/qSXS6Yj/yJtwGPklnphdMJb4GQR25XfwgwwNZPCjW42Eoh/aiNkjGw17YA
	 yp/n0U86AJZDzlE7QM49toK70EepR/HnhiEXy95E5C49i9ZQMXM7l1qJyHMtnS5a5sef1
	 J2Fz+hU/NuwZMTCVxQIeA0w8+51uzgU7HPEVhYezudFxhoVEinXbrLJnt+pp58HUKWr6E
	 Nu5zkvUxgluO17F78aofZ1euzcB9SL9/TXsBsU9Tp7VX2M6uJkiNc6SKxr9c/klcFvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NE+8EWI2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD7606A31D
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22CD7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NE+8EWI2
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso419560a12.1
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564542; cv=none;
        d=google.com; s=arc-20260327;
        b=q9+Ekn1TINmoVCUnAII7srFKr7EGBpszNZCsP0LEwfyiFp1fXiqA4CebALnXk4M9+5
         lcSsgHamETeJBcQ7b4bGzlnHN23ZGxNzEVoItZbBU2NlUFcsDBTHnK3AE0+CKtbowLTM
         Zsk1kEvIU4akujjyo1Aoai5+6MnaXNPLHOUvXvz23E1T+aWj2ZtjMzPVGUhGOqzkxoDG
         MeSyfT11hcJFTv9l95IT4bH3UBEjxj3S1toN3tfH2VBwthm2tKpahQCeu6B12j1G/PUa
         8TbYYUHnCRISBhy1gT3Ysal+B/IPBnQT492LX94MouubKnTN6Fyr6T1sBm1fglSaUI4y
         KK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        fh=py5PxUoQvpsHS+NwAezRE2kyK909Rw5nqcjPEVBE8jE=;
        b=lWR7t5d0dYnv2DG02D9wA2i7ATOK6wWcnkjeSwn3iCUlVFbycBsE0XuMboyqDc3nsp
         BB+33z3xFGbxIjHF4yIw7mGuvYR5ZKCFQOdkhuiWNhRWjG7Hf1H0MOh6okjmM7e2fdAz
         xJq1zHhS/fKQbi18pkKtozvRHriElS2CJBtEC/C7l7EUJ6nut6uzAII0x5rO7RjUHYt5
         yVbZ/hEHv1tIAFeD4TU0TZaI2lrYtpfH3xJFXGR4TB+anY0yR4ZYYnr6cw+Q+pOOJMMY
         V4h79Bp6Y0io4FO5bIKiIrI70C0PkOSEhw39HRkbgHBr2m2UClfEXe1EOH9z+vSsZ+TQ
         Mu/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564542; x=1793169342; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=NE+8EWI2mohRf2iHl6oQyf8jH0/RH6j58ziPzFLD9C7GHTvTNSJAQPH+MwascmjDbF
         TKuXn28EXS2y9yUHAfE3EHk+QmncDwsoCXUNn98RjojeGPys8bzJr50nF9l7fgLfDc7J
         bIDWQbeAszJPxAbqQFWReeP/7C6As+TmBqJUcxnZxI4Dl30DHB9HrPca0v4AH8Xop47Y
         eY8+fV6O3r7vDr5JVRiMuAABFJb0BvaeSDYyRpibzla3xFpOSSAKQzb3vkPj2NLoXtkT
         UQiEiF1exKrxZxksESfmug9+rcWQD2P19Qvn3SBTd6NPAzbDNkL/inRXbBmGAEHvCmgw
         IvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564542; x=1793169342;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=a3fLywTF1kjPwSSbfhPNUJ5SZ48CrzLGARe5MDoZrkZNV5pmSIqrjVNfgq2Dol64Dn
         1P4HOlXtrl9bAWv+H7iH9UzWlluA31ChRprCetehCsQGicp+kv4ZrtGTSZS2ArMLo5Mf
         ugQMAKzHgrRJHRjkDrk+a/poxkYaDTe1lRwEA4m7mLH6XGTNHOec8zQq/JTdeAuU3h93
         iQ4sDOvOyWUAcpBlZKyIPvgVEq/msRFkbwrxxohRxfGfrrCEMqMLdkMlDUog+u3tYUUM
         3Ob8bh8EvbrEo0S7m4LsA7lOGEbkI1QXJxCMzQVmINzp1RJ3Kgux7+m4ZZSCsfjVTK0J
         uzKw==
X-Forwarded-Encrypted: i=1; AKwUvByaMnu5JknyE1RUr7wnDdXUW1K/8KkYLsg0EDZawI4yvZTO2Q/O+mMZ+4M0YbSxZl6zTSA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIsEh0CwplW4Clzz1yLhNFKj/nIH/6eMwJNZpa0AkAIHSlDLRsq
	5HXqWVrmtacD6ICnOCc9r46yh9R8bts0i0sD5rQvqtHx6GfWNLlO4Kr0TSxv03bVAC+GuDqERQX
	U26Lm0nwt27D//3E4zWbXi7e8nXMRca0=
X-Gm-Gg: AYBFou3X3i1DA0a6HmUO488PtEwAjqGxhOYHTb3uqp/XU3pFASK1Q+3xIfkJ9hDnQDY
	OCczUJE5iNOrqr155sZQ4z9fp+5nTAGCz8TwgU4HUJEDPFF8yG672Y13KRYvjia44wtX9IRqM1H
	2XVeAtlontaEQhnz40ux1UocEzuauQVksi4a35bDSQT7qS7TisSTbCD9zbqVcJHoW4ora/er4VC
	AV+YEPZ73fRknAYhhwLZp/vD7TH+qJwvChlFVCMp2tgoVnbMp3wbYq4bH9gzrZEA3gNnktZfFVw
	QR/mHrEwgPb1iMCxdlu/4cby8cAFCiDNMoTzElyqUXlJwr4Z+gWCs/PRP9DuqLz1Wzg5o1T5KvQ
	KuNobKu21rlcqucFcOEpSg1NGznPcDz3tC2tH0AOrqfKtHjuRL3/HbaVz
X-Received: by 2002:a05:6402:2105:b0:6ac:5de8:ab5c with SMTP id
 4fb4d7f45d1cf-6b408ea04f0mr627314a12.10.1792564542175; Tue, 20 Oct 2026
 23:35:42 -0700 (PDT)
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
 <20261021023245.GA3650393-robh@kernel.org>
In-Reply-To: <20261021023245.GA3650393-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:35:30 +0200
X-Gm-Features: AclHuK-lIJk49lXRNa98GE7gi3l_Bk4TgNu432VwdO696lfchFDIYtZnsg1U3Dw
Message-ID: <CAORyz2JS1vf7P2cQkzYse_WheB4xYMmywWi6v2pNbeFSkCO9ZA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Or drop the example. Is this one really different enough from the
> existing example(s)?

I am so sorry, there actually was a previous email by Krzystof
Kozlowski where he already asked me to do that and I thought I had
done it!
I'll send out v11 without the example.
