Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5983B7752
	for <mfd@lists.linux.dev>; Fri, 17 Jul 2026 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271711; cv=pass; b=Oz86xfjH3+VHrLXARUGDBpj3TRHj3uvosQBXGx6kisWU/ySpMOBDKrXPegCPacJ/d3HsSL19GWXlyiojShQrH1rfQZ+n2gn/RFwKQE2yhsvF+TmmNVtr+LgqO4XpEZMDpoyOCEHyMaRVI/YG5ETeNO+qkpNMgMZDSCPxmgh1/1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271711; c=relaxed/simple;
	bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6VKqpsWs7OWJIuaHxGw5QUwQz+M0UfKMc1EFe1fvuYOSI7lPApV+xP33bFuxFSJuifOuPMuQzLLy0f8Hj+gi9M1vFfhYqQZako5CGG8NPTMQ9AP8puhdDsKWtWQPM7KKHG3s1/z7x+GXVrupERvRzPeY6Mw8BXwZsaNeLNjI8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFdh+fVn; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFdh+fVn"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c2808dbc3so46328091cf.1
        for <mfd@lists.linux.dev>; Fri, 17 Jul 2026 00:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784271709; cv=none;
        d=google.com; s=arc-20260327;
        b=q4j7aWDjcvh0Av5LWAui0dZgbgI6+7bOiaP+6DIW4DEpYZ1xARmFJLFhUa9WyqojyH
         i1SMwvujPSgSaZvS2FHLLh5gQ3uWtGxfTdY8sVwChhkLRAkKlwOylKe+uNbtrHc9w3Zg
         wtRWXo94A56+xEeCtbxRaIX6U/0Z8ixgM+DQCe1NDcT6Msk/59/hWl7Njq2XGw8G6PKr
         pK5RXPOsXezDXcaVtoKrsBgrbAEk9rr0KfRZb673fig5ECaHaeIGVCaGR92Wk7/UpBiD
         DOQKRsJll+hwyf/6FO4DCfaKF/79yPwIZW7nDAa1OrjFjM5RvajKGldOVIod7zLg/4CV
         ZKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        fh=LXTZo2Dffcef4qUZLnHv/6EieKYXo2i4zaNxNdMulOM=;
        b=b10wymovxxAQQwuZ9sfqRAynOqkYjLEmVews7rwDG7Skbobr6cefMm0wcIMu0lp6of
         88nIKuAkE1Jrf7liHdHbK8ctrOJOEMjvNL7RlfY9vyYy2c12dIryrmTk8FZb/VCj4Hxc
         LOJbbN44Ov3I+l0G9kwQq+Qu111hkPBUAB+rWrCfIwlM2FiEfV0a7DpE+QyEajPovbhB
         BBa+a9/5QjNUYYwox/82zbUykKdpF9wXoHwG9jX1agUs22sQhnplSkkOnTtGdR+vec30
         aw9I1uE4vPhnLepvob21obN8+SElooZobe01He0Vclr4Y5kf3GVrspjGbq1Rue0xUklk
         tjkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271709; x=1784876509; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=bFdh+fVnsN7bQO/oIjFBW5tqPgVWObpZhrmkOFuopczFaQRXXtl/Kkj+jKS/xGRBfu
         bi+uj3aImZHeb4tlq2DVe1NGMXlIV21Ns5lFyCmTd0PZc2IMyi18mjDaUVAPk3d0ZIio
         9wFpWj6QUJlbs2W/nFH9GTprLyGepLPnWCSOK8Eb6pJHo5HGbb8oTSAllvf9u2WT+2Nw
         R5c/7+ydwdvaiJu6KdwO4iz5khHFhFwtMUEk1JHIsFDNAvoAPlkS2VytZjtXx6utO7AU
         3iao4gjM9LMCvlYzcrw+LODGF4AYVbhvK5pzMCqQR3TAZBz897cDyKH38z2ZsN8UTT55
         ISSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271709; x=1784876509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=ezAksif91l4t9b5cs2cEBFOu+Jy3RaSIylSpWgi89gRG6Yd19SIp+zPxpGlxytKjzs
         7rYpHgmgCqV2FDnFv1xCqfc9CsKF7gCf3JtFGTpNBA0mx31IpttpNLZHYU6nV84fP2a1
         vibNgGQOLFzpUUSf/1FoAfcH0fQ5LUzHupsGYjJVaMXeF6N6OLLkG766D1wbmvbnTK+B
         mn+/vEB00eAfIuY4gke5EVmGbJRgfqMWRSwedFL9xsjgkDIWOHIDBduolzB3VfkMcKPk
         Fxv/UZcu7u7E4fo1rjUxpJq9o0LBSKNmTVuGm/1x9lFt3XcRXmrlqkMYIsUbBCUMIdHA
         IkrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3eDcaK0ssIp20MjlWLb2MJJQaYl7nU6VvywPabLoplGdYy7Kec+ri6uTdGXpycHmOt6k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ96JtT4ppl13j4g6ii2tENZBnk8v9AOW4jolvOQTlkBH4QL/f
	8nDZU80NYxvTSP9SaO8ILzMyJkGEMvAMBZaikZNDCTMN7C0LFznBuXlAd764e9WiGp9iNJeotYf
	LufPX4ZAKg4az27GJxH5tLCQG6WXvsRc=
X-Gm-Gg: AfdE7cmzeJ9xEYtYLvVnVL58w794ntmb+rBifDO5wfZxUZiAkLDCnllBGQu8XcKxXKN
	LS5W7bDKj1svYqgBD9NVUAN49wc0MQmYgqdQhujg6enZsRPxj7Hmt2b46BZtRwtewN0+LO5dCXg
	ZWCSu8dTtFpkh87veKVWaL8H4lcApQ5Nrpg2uzDH4/jBjS2PC2BoxGBzexTrHVKEmQjCQigqWyw
	Omjni/MrVC31ioz58IjlDW2uobg1v+X/X3phge7K+SuZCV4rlLSJjvKPd/4lwYk
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id
 d75a77b69052e-5213c9db3f6mr11147141cf.26.1784271708847; Fri, 17 Jul 2026
 00:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716171733.300885-1-akkun11.open@gmail.com>
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 16:01:36 +0900
X-Gm-Features: AUfX_mxBhDopugmTygQCr_ewrvNPScsxhXpSrlqnE3VeMGuqzfUam913liCneCI
Message-ID: <CAKr_iV4=TAKGb829nXWBBiPkQHo7dFyhT41K7+Twv=VjaEypyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: "open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH 3/3] has a bug, I'll fix in v2.
Please ignore this series for now.

Link: https://sashiko.dev/#/patchset/20260716171733.300885-1-akkun11.open@gmail.com?part=3
