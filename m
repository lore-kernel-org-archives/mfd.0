Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594866;
	b=fM67LV9cX4OmSamSqaMDjRF0aQB3FTm1SlBzjWUA9Ivjn8t8A+qBjxTIswGursKbbjEb
	 HHZa0JH/B8/KyfChexrZDJB89S8FFA+VWGYMJoa0cGl1khgEXpmB6fJH0M74jNW9tlg3Q
	 cI5swxjwDI48E4yhkF01IgGKJthmWSJJXPLuFC3Ksk2kk8pLuSpHWsRSKvkzIqaAhWXl3
	 uW3mXPXeILtBaNQ+jXLUU4UexYk/gR7CQ3K3uA4ivd7iRPqqlap/FN2F4hWjwf+2Vi115
	 LUHiiLEywWEhWgz6k7K0HGa6tOILzXOzbYuM6a9yuusWKUNX5B8Rrnlem9AIJUSV6XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594866;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=eBRMIVuniFZxe5dLg6Ocb2OqQrm/7DI1rMM/oau64Qg=;
	b=OmWmxgl6Qx59vUPJ3rtCtwtTIjijH8t7CP3TSK8KVONcMqe/oKTpd2BCSkz+CAm/lqHy
	 pKxkKvHcYLY4itPTQD3VDAz5AZepKIhQh3lVl6O575JFYWaAIlH7YR5DX0hdloZJ/zw6w
	 QlyUDpVVaIdOaYBnMp2v6VgM+FH+7ag/eLuGv+HO2cIYPel9JqTh21MS7VpV6kzoqCHvf
	 GJ1dAO32RHmkfrT7RZhifTYQ4oENhXUtiyDMk5DaZXIqRMZEgmPs5bP31np/3XD+fojXg
	 y3QU/HAhnOnfAxBa3Lt0gdZTYllZW6aUgSfQcbzIJOIL8qJ2H3qspzjaJmejgk7Kq5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3bN3c7V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F184C606A321;
	Wed, 25 Nov 2026 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3bN3c7V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836FB1F000C6;
	Wed, 25 Nov 2026 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594865;
	bh=eBRMIVuniFZxe5dLg6Ocb2OqQrm/7DI1rMM/oau64Qg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=l3bN3c7ViLysCikSwClJF6StQ+CTSfJp+PaZpatGNe2B4+SAPhALIkvEv95zAZmD3
	 HnPZcJnM5G+apOEzy1MZa+VQRnZqVBMTAHG5BTCBjppb3Rz94srug3zz7grh56vOCh
	 7LCTUZsowIbX01QYfuOKlQfdLUoGVhB0A/VaVp13WI7RZNrqwVVZ3zglpb8QBEqj7V
	 DbrQc2FQ2JjaV7+NdRQij/93yYplg+jkwkcORdJ/5GO0hhZZ7ZzN4RvODUiKHU69Xb
	 0krUJmWgQAj2xQ2lKV+T2xpnCikVs22EebzHGri4FERot0+Pp3nLLkY2ZeNFPVpdyU
	 8Hu2SG86oQzNQ==
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
Subject: Re: [PATCH v2 8/9] arm64: dts: marvell: armada-3720-gl-mv1000: Add
 switch fixed-link
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-8-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-8-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 09:21:01 +0100
Message-Id: <179559486198.14607.4946542325062000639.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> As the switch port 0 has an 'ethernet' phandle, 'phy-mode' and one of
> 'fixed-link', 'phy-handle' or 'managed' are required by the DSA schema.
> The expressobin has appears to have a similar configuration, so copy it
> and use 'fixed-link'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
