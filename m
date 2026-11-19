Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098397;
	b=C5rgtlhTkrW3hGiYl3zIy0xOAxSF842PBrkAWL0y9bEDXVZfOqFwckCwSohoVCfn1GXA
	 /WtRsxJddBsQgp/QtA781I8srpecrxjABrgm78EidhMlmwL6Bt1sXvSj7Rz878f7kssQJ
	 AUOOSHhExhPzF64VrY6m4xgGDyJlWvIs06tiPhAWPZnUSO7+GEJfmGCEYOilfF66KZJQM
	 9B8uKjNoykPW0C/yldvLLHS9xJAvfCHlXIu+MZQfVq+AIsxu2NNnkaFfH0jQce7HG+EZA
	 JxC+sDU9szHSZ5fl4+Ttvq0rqim0QJOaXJV+3CD6z5rhUBHNFhNU5S7DYY5Dw8VOHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098397;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=IHiaZCkpgfisLs5dGgPI+Fvd9l6nPCi5t9cGKAMHJg8=;
	b=KhfnnJBLUceCmVU2SupPMHIU5IH+p92OqWgd8Dlcfi83ZfzH3wkc5JuCVfVY8oq+DxRU
	 hO8EYLhfMcxIFGCTuLqDAEIW5EoklrlsUOGjbfNGFNiFPer6XDJ0tGw40g3smiIHINjtT
	 Q7w7FlX7ypoetxkXmH5SU3wPiZqyK/Q6bsQ9qagX9DLcImtUefXzu62Nxwvvir9BzG7iN
	 JN5p3B0fDNQ44XSWJInat9eV4r5n8vo9EayETz5jhEmIGRZNq/wGNkVk5Y4QW3ifZKe/4
	 3DeoDUSalJrC68CWxRoACQ0NgvzEBzxZQk5VRqJj3lRx9O6FJRr5NGZnMkY5tipK+lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTP1e0sU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C7606A332;
	Thu, 19 Nov 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTP1e0sU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97851F000C4;
	Thu, 19 Nov 2026 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795098397;
	bh=IHiaZCkpgfisLs5dGgPI+Fvd9l6nPCi5t9cGKAMHJg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RTP1e0sU/YjFAO8BdotVo/iCkVc0rW3byOjosQI6vcDmposFxYFx0m77qO32fuZY3
	 SqrHkqG+qRX3MNWtgMQ0UNCOzbWyhr8u1ncsYnujaicrBfp7JpcNBvGtilnYT/qai/
	 9BBusmCS3qs2ChbUo8Td+5mH94IvIn31fvR6PBwLGe7CyCoINRwgAZGnerG9yc1+tP
	 2cb0Qw3ZU47VT81UlonE7j4PCH4eQxxVnKxNn/8Ux0LibqycER1cE7UA/qmgPd60Hu
	 p/vDVL2xzadEvk9YUJa5yA7pPFxzqOBgCFTlKXEP3oBW0dqvyxQOS8+jKdvSrQ7nvz
	 RMzn1AX1AtJhQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109184654.462128-1-robh@kernel.org>
References: <20261109184654.462128-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: max77620: Add gpio-hog
 nodes
Message-Id: <179509839557.51593.10388209858406137429.b4-ty@b4>
Date: Thu, 19 Nov 2026 14:26:35 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 09 Nov 2026 12:46:53 -0600, Rob Herring (Arm) wrote:
> Some Maxim max77620 users define gpio-hog nodes, so add support for them in
> the schema.

Applied, thanks!

[1/1] dt-bindings: mfd: max77620: Add gpio-hog nodes
      commit: 6b77adc8c64114b45f39915f156b558148d7aff3

--
Lee Jones [李琼斯]

