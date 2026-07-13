Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA059383338;
	Mon, 13 Jul 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928204; cv=none; b=ju0zHALGgWGaZQ+aEQG42oXl3hJZjwaXJuGU69OhwYQxDn9gz3wgmVxXfWCrfXiOoX6dbl57qKWUJ7VjDHsmgOXaB0YpZujTPRtLNj8V6e1OlKm0u56BKKbCxr1oI6NYZHQMeDUMh9rZOEqWUJgcjgSdYDCYiZntQwIJQujeNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928204; c=relaxed/simple;
	bh=/Qj90RKB4cdKIamS48DnJJypIX0aSS3YeEwLhW4Cn0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCNEgb0Ji9j5EUqA8PPvDNAiydgkio4rkt4SS8gsoss1tqih7iJf9GNuPQ4J1rEgbQb1kTMMv59wbE9ZAQDLTkqyVvO/QetX4uL0wAqgbmLCPijhOq9gEnAOpfGOTJ6X4hUXk2kxo8q28oOT/qTPJGp+K4GlQ3x2yTjNpo2w0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfllB/fy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfllB/fy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BFD1F000E9;
	Mon, 13 Jul 2026 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928201;
	bh=aps+v/FM41Tltc6BjRSUvBfY7JL4KKroqTu9V9gK3SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dfllB/fy0VUmUy5IB1SbvcG1UHbsMxsQAK1tsa2SlTgt85FfFdoKZMJZmOf6XDRHQ
	 LDxXV+QGoZeeSDL9emus8OK3USfdAWSP3FpRUt4SiiBdHChj0oniKkyIkybiJDaWBA
	 ez8+Xs0ZmojAj5hMUgYghFLP1KsvyGNVODJ9ekkUw6/QrqsgfgeWDvcqg0GAedQCqg
	 6+98v2NAK8NVsIc1tLOdyYPtsOr8KGFY/nilFuktruS6BVMkEMiTGoRFqA4aMk2IU1
	 h/5oAIOhatIhPLXVEiPT4XsKE9pQVtr2PlTM7zDeqTUm2hr7admsHYM7qW42PiFpOf
	 qiJMMPtqpH7jQ==
Date: Mon, 13 Jul 2026 09:36:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Hawi and
 Maili SoCs
Message-ID: <20260713-zircon-cuckoo-of-relaxation-cca5ba@quoll>
References: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>

On Sat, Jul 11, 2026 at 12:57:37AM +0530, Mukesh Ojha wrote:
> Document Top Control and Status Register (TCSR) controller for
> Qualcomm Hawi and Maili SoCs.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

