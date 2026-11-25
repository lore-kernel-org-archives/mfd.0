Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594856;
	b=0jhwOVPct+wj1POOnv5J8n6/ZfViKZJBLnDmmMCeFt9iuAXjILSOO7RLJp65QoIxGLcl
	 RFpMHPSHkJ1kTfz6MNp5jI2odNyGkou3x/wdH1HuUNNrjh9lpORuP9Yu46QJ9RDYG7dD5
	 FG5M0DxxSX1CaCImOMtvoKe395JlPb6KsnE0XwMDDtoDwlRnnJsTGe3S3RxhS7qolCfwB
	 4aR6aNdAMIgNtKYLB+jxr8TdXxqTexzIbVUAYnXb7BZ3ONy0s9OnmAjAJ+NeO2LMPSWwz
	 d7kMHhOLpzo8WCj+g+ec3Wpg5sBNXNMBiBgSnbrGkVOELrrRFRFVILDvBA145ru6xLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594856;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=wz7iJ7/C+al2wsNcjwCJLGM55CpVxGiIFprkKm3yEaU=;
	b=xu0yiYGcfSfFQVKVxtVjP1Vg3uDomHL6i5WL4BkGtdBPkvvX2uCYlEYy/Ftl4xnK665E
	 0qzIk6Jg15hJEqI5cSsxiCedbgMy8C9vtrlKH8jUCWtR5MfbyDzm/xpV7Zm5loREKnZLu
	 gj+3bQG/1M8+y2vyr/lbXKM0bILRbuSSghy8KxVqZf8UKHpYY7RLU4eu+44IPceAs8eC0
	 D07+4FBkOZUIxk8hOcwthqw2GtMJEspJaugMcyydcmWSfQQ+GeJwS3KTm9e/ycYWvopGe
	 Y3Wx5wkevd/GbVc3F2ajMRO+zsf2gu14TJoCB2hzec+IMRTM72BiCFly7I89tV2zj7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcmwcoGT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34462606A31E;
	Wed, 25 Nov 2026 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcmwcoGT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEACA1F000CA;
	Wed, 25 Nov 2026 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594855;
	bh=wz7iJ7/C+al2wsNcjwCJLGM55CpVxGiIFprkKm3yEaU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TcmwcoGTgJhdF0/CY96V3d+BxrNuCMfdhlb71tM3uoBkYiDrtP6UZBY7PzIsmrwZB
	 dWbYTTxwpaJiNuab2qtMD5HqBmPLhSSHuF+VEXo1O6MeM4EY7yup2aqLd1Z6OuhW+l
	 ltnUbDfRsPtcagSkU/F7IJZFln/skn5NmIuHmxzrRwXhG88siIt8RUKgEblaw7dLK9
	 DWtzi+ud6CKSmtluSic2qUr5MQNYyoAifAAazWNHD5uBzlvOBsYDW+LlPRCTM0pAJM
	 6vFHaqkP9QOeRhWn0dtOKhgZrRA78oweYwhuLLOHRWTIPt8vJOmhTqVT5P+mmie09A
	 OWb/wzqMEHGmw==
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 7/9] arm64: dts: marvell: cn9131-cf-solidwan: Drop
 st,m41t80 reset-gpios
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-7-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-7-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 09:20:52 +0100
Message-Id: <179559485224.14607.4321830873250502368.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> The part has no reset line nor does the Linux driver handle the property,
> so drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
