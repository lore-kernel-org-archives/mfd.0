Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591230;
	b=G9AIFnvkiQEdSNg33w9+FWuC9aiYI9ovayo+ekEF2JAlWNPPQVSRJ1TMIXe5nNrM6d1A
	 h8EqEBgGD5zUhXs9JW7aP37RGSyK4LzSCQHkbOP2mZsQBNMoJriwh0XndH2VHiq05SBe6
	 SZl1GH9qvuZWlu65aN8ZEdPITB+UYABUFdC5OxaqKD99U6bg1UW+jfwLy5Awh/LSJ2OSc
	 mtxWfWr6xATCzJo1pgotvQOAr0PtMx3qnfIEBYN7MITYreIwoj3R8HP2tQa13MC3SfdIi
	 n0gXm/WTJ5LQ1luGwmgJlZQ0GYRmrjV8HKeL6QsmEuEIKPHYRqd1oRx9SgvexRpocRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591230;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=L05En4/xKFVGe3YwLYxtCb15h7QwemjDiV1X8U2nthE=;
	b=HJbuf0f3Luto23jSK3T6xlkg13mF6BB5Vz9rAUrmgnhZ1gp/WC9uE33PCOF+olZjFfq6
	 4JtoyLAaqyO6P8nV1exy0JAd669wZ4H6IHATXF/12VPoGmK+Pttul7arCUht8QDA3SaFo
	 7nutZQ3l0xDU/m9VGHI+gphqheg81AhWlLaDPjQwwfaeKAMLD4jA+aI3c+ONMCJMqNjM8
	 ECpnK5Be0b2xbyJcIg+LaUT+7PW58gMQsL2OdMVaRum4OUbGsDvh81Dop/ustou50QcWT
	 GLreRfbLhNCWI3L43VY4MXmea806vDnjH7roW374rCi6FUysBlT8YkfFYfMweFmkPig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CI7KwRD6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE96606A323;
	Wed, 25 Nov 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CI7KwRD6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850C01F000C0;
	Wed, 25 Nov 2026 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591230;
	bh=L05En4/xKFVGe3YwLYxtCb15h7QwemjDiV1X8U2nthE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CI7KwRD6/npgdogDA9soGnOx7aANCu/YHtpit9WlZvZg6ZNb5WZ91xuGXsP7htK9g
	 AxNgBw6ZxZd2f6JTLRrLXyyVsLDB2JfUyK36sJdxvwYfems3TDhQd04jFCNZHUrli+
	 l9j3qtu5KNZ+lerE4srjbX7HELfzHhrXTwjDtie0f7LzJhHXJcf8ZhmnytnfsAeBt8
	 Ya9P518uE9M3mZKCYl9KJzZwloz+9LV+RQrwPgXWYdEYLkvFo/XXGHbWsDXoz74ntk
	 11l/Lw54Z67R5RWw+J/uPKkCX/Xq3kJj1uph9H+K3yqDaBXtcDYx3Agm//IrDrHZ3N
	 5N2FqPYzw3twQ==
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
Subject: Re: [PATCH v2 1/9] dt-bindings: mfd: Add Marvell AP806/CP110
 system controller schema
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-1-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-1-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:20:26 +0100
Message-Id: <179559122613.9063.9445094754243687783.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> The Marvell AP806 and CP110 lack specific compatibles. Add a dedicated
> schema for the Marvell AP806 and CP110 system controllers and their
> child devices.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Update compatibles to avoid old legacy ones
> ---
>  .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
