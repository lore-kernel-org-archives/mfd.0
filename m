Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700982;
	b=Li3LtM0MfX3fmnV9/KIeN9+d4lKD5B3EaAC2R/JmMoBkKW2laMv2FAbWHcACTxhZ/4lG
	 LqKTfrbtO2fbXudo2g8FY/jOZmjqSTe8ULYxrB+3uYntV3NuLF3HMEjj/bbO8VRVHLPZt
	 MIRCq7rCqEzPrZYEda5ZQPhOeH7TMnkjL6oryX3jR5YPiTXmNSIlWIO9PZFpRVDt7t0ri
	 ryr71EgX36VULkillQULJzEu0Kfe300uj8Uk68bog8WhYwq0PlWzBP/+ytAz2Wp5WLjku
	 uh/t17hF4a035fN916+bOBxP6qc+xBM6q2dlEaTpqgd+lCapzk2zNcKluP+WC8mrWzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700982;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=aXLXQaTVxzvHfzZ5Xw8BhaYQpUv8mWSspk4W8GeUq/Q=;
	b=m//XYbyckWALi5MJdKruBZdvwQKzqokuiUl2+5o8xVUymzSywAEBboe6Ro9YIYx6b3dp
	 0//fu6uLqcfLBdoA/QH1RCZ281UpKqX1VmN7BKke9NRg8uHwk7zzHmrckRKVSv+vmvN+h
	 kh/0g8fDfAEdzB+CN/tD2msj//pS+UMaNOrHF2mPQd59hgyuIKnoyZzS8STM/2GJkI0KI
	 xgeMFFToZrAkcW8/nITvW4Q7plT/i3ZhK5pdFFe8dk9lARrfkhgkGVR4TkKV7O7SUPkFe
	 m7lOXclEJyBSxc+w0mmftPR9ldKgoohIUNboK+mg8PSrKrzxU9z2fjPPOHFbCqum00A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJ2YKlIv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3D6606A31C;
	Thu, 26 Nov 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJ2YKlIv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542181F000E6;
	Thu, 26 Nov 2026 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700981;
	bh=aXLXQaTVxzvHfzZ5Xw8BhaYQpUv8mWSspk4W8GeUq/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XJ2YKlIvFRz4Ehyv0qJvJsMvxnTVXauatKJFQKD9pPsOJd3A3JPqry7THZMpEufoQ
	 6QdmtRNCTFLOlEDkm4tKKGxQ87H7jMiMjlTwk3IidUJ9u6WAU0t8qWBuIKeVItASr4
	 C59v+waqbxcuCZoExbO+wF4oOgYQKO9LsPgRNZ5A6zqmN9stC2nrwGnQNsxiL1/trb
	 OgDC9BKiDRK7IBBcseATmGk4Om6NN11Z3ML3jDovTiv7CWmsSgFy0vWRR/tajbHu08
	 XPgOofJG8bxqnXcF/xtmS6rninRGv4WqOlkvRnZ3w1WYWqNQnRDZUlwR1rpT+0ia8/
	 NcP/jgaTHW10w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Icenowy Zheng <uwu@icenowy.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261117052456.3747585-1-zhengxingda@iscas.ac.cn>
References: <20261117052456.3747585-1-zhengxingda@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: syscon: add T-Head
 TH1520 compatibles
Message-Id: <179570097389.79319.5412421374255035653.b4-ty@b4>
Date: Thu, 26 Nov 2026 13:49:33 +0000
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

On Tue, 17 Nov 2026 13:24:56 +0800, Icenowy Zheng wrote:
> T-Head TH1520 has multiple system controllers for the "subsystems" on
> the chip.
> 
> Add them to the syscon binding.

Applied, thanks!

[1/1] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
      commit: 3f3be04cc3401a6d0913e7d4504109f4b3635daf

--
Lee Jones [李琼斯]

