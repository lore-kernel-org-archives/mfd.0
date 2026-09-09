Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75922531AF9
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950755; cv=none; b=aybWFP1C8VvCY/H5mV/TSJ4RXUbjfrsQgrvlNfMI0wacPQgBV/e9BxRrliHGzNGOVOd5zX405t70ANR/WMQhl787G5Ma5N3J4LGcw3AEZzR4a/xD/YVniBxPEp3/fH2IHMvxAFUU/6N53gSPOdDCI8/mwJBxIlE+cnKI63rD4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950755; c=relaxed/simple;
	bh=tfrLqcGsEUuzNpqwHNUq3Kj0poSsyq9DZH41qa+NCYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYskUBFxve1M0CHmqZ2cI9hpIm2o/ExO+Z3okn4A/b3SQ4uXEMG8+Qhd3I5hLHBNwT8j8vj90c/+89UInfE+PakJUvdePpGUerzUk+clYo8wYz1N9TsDfXNTiYWQ3qtnJyV9jDn7SibHqPNs7w9CW1aKurnbpGXFrXBO8xARNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ya/mQWsa; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ya/mQWsa"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so16346a12.2
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788950751; x=1789555551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MH6BpfVCqGiCGTmNR3nzVfS3qVLZltUsj1CqM88T+M=;
        b=ya/mQWsa7D0DlbwMPQpRA/FTkaDN4YMkd/rf2vzmSKmy4nlqf1gkewDqmPTNWd+PL+
         mIaH0loxct7p12tohTRn8M9Mi1JtrxUrwvrG5J+4YQj3p0VtgTIBovME98QozXx/zU8D
         Dk/+F/f5TTrBNANG5ntoW1HXy4aSsHcfE6suUn44A0aoU9bPtN1wp31Rigb67xWvShv0
         TB2FHv5ikU85ctM2qKEmRO1geTbb+aP7LSTKmMgT62U5NBc7s7fmEMvEJ2D5X1aIEnpf
         pnDQ83EWBxHDfPvymlt5c2ZdsJ2guigwLu8uQTqkbJ5Eswy1UV/DUDBNeI4l86A+XCe7
         OIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950751; x=1789555551;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MH6BpfVCqGiCGTmNR3nzVfS3qVLZltUsj1CqM88T+M=;
        b=UdM1I/MHBhyRTtggSCqMLqB7C08y3jfuAbWhBwM55aAUQG1vmECVfGTFjNeB6cvWWM
         MbirSOCP0exXRGMsvJtHUJVN1jqEVOOiEBS3MRNP8bwNIjXvX+wWssaJ1SwByArANy5T
         Sx3EHl+JNR6zE4YiLmaH0nxMBOLIjkC/IsLoFzlYWe4llW5fZi2Vc8ebk62KoQXnzols
         PDTZR9tjOvVE/QRdEH2bY7bybyQTon1hhRCPQgUvuhgNFBbbmPtFdEIfNRBRQq37CyBS
         m/v95WFoB09yZLuI83/kaAIi0HlUCAnMbt1BAZzeyS7bnPZPvTJi/U+7c5tJ4RXEHUVV
         bcjg==
X-Forwarded-Encrypted: i=1; AKwUvBzQaMOZmbia/qm/HgnTgXG4c/3ym0Qm6mOiQuRfk7jtm0T2WIQMq1VExgqi2PTVU4mZjqY=@lists.linux.dev
X-Gm-Message-State: AFuF++kTktb2lgjy688GpRjh/0r3c72MEi1MIgS6x9r/0lDCDrQ5hHBz
	yhrcO1MmDXNSOVSPNKx/DBUcNpKZNMYMyd4DIhEV2vij3Z+HUZMPuICDunelW4JmXzM=
X-Gm-Gg: AYBFou1y1L35HSuuGDp46iNRZdSHoeheg7QNdslFTp4HzayPbqkoBpw1PMDkxZSzqXL
	T/hRpM2fT15Q/7HNWDIFSHutleaa8j+iFq6Y4FcFPY3YBYaeTUzbFkHhOFsZ12CTFpRsDqB6+/+
	9lN40cq9uUifGXrZnTTyvnZB/67Pt+srTp0eXRMcLpY5K1N96BqmKKg/mzS/vJjDzIGUq2m/o38
	Nl7xqTWwne9u5CzPrCHcRhEm++zVNcjGauM8m3C/zYMEIlN8i+aBd27WC9Vv5W9C75nmTYiBzIs
	7leRaQTweMJhj0Bg/y+G7lIiuBTL0VOY5iAWlFj+hbo0qDn/xu6Br0Sgbq+3HOvxqXHpgJJtooC
	+bX8sZvxrVsbNrTyyT54I06cYg9x3+WkYEXC5ucHk41/quuBuh+Jl7qNpHor2nJoloBGNTYqJ71
	QJMu1yVL7sBrZCFY+Q7Sf2g9e0B+7zY6qD+v+qHqFvwDncbqxT9SWVUMUwh4c5v0x2lz2m0FTMk
	cnZy6u2
X-Received: by 2002:a05:6402:3253:b0:6a7:f5b1:2726 with SMTP id 4fb4d7f45d1cf-6a99ccc2f32mr65130a12.8.1788950750705;
        Wed, 09 Sep 2026 03:45:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.32.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm6886762a12.30.2026.09.09.03.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:45:49 -0700 (PDT)
Message-ID: <eab4c6be-e3dc-458d-8011-304a98f2354b@linaro.org>
Date: Wed, 9 Sep 2026 11:45:47 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Guru Das Srinagesh <linux@gurudas.dev>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <0wqEOKsKQUG-cPJyVkrWjcUUrp4POMvOxwKLbIaM_HQ9goiCr0D4llW4AHLrRfqjnLWyFVvpWNGbwqu6DNBM7w==@protonmail.internalid>
 <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2026 09:13, Nihal Kumar Gupta wrote:
> X1E80100 supports both the legacy CSIPHY resources and the new PHY API;
> Glymur uses only the new PHY API via standalone phy@ child nodes,
> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> X1E80100 has four CSIPHY instances while Glymur has three
> (CSIPHY0, CSIPHY1, CSIPHY4), expressed entirely in DT.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
