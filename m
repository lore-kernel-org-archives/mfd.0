Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6019370D6B;
	Tue, 18 Aug 2026 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036472; cv=none; b=ZnYg3Upud+OEg5BY8nx5vtXUx2Uwl7yMvDISwqGQsyMYIWEsaDreqmK8WE2uR/Xo91aB426VgxgMtAdAdq/IF5Lw54h7cGzCTRjhRnp3mlhz5o+wzp1eR+IEspV0j71tWxytHii5bJx5DN8HATfH3o3RRG/tU5eeYqKJQBxbqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036472; c=relaxed/simple;
	bh=uTVE3Zzd6SIEe17U2URolCUWLuJ4P2AATkXQvPhXVF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUJlINTCEmHLgkrj7qnPLiWXZcdanpdylC5rXglA3YZlBJycXtMPJf76hwLu0SHKMKnozEIKq9KIhLZBHtEGSD5ymqwzulvRMQeCGot0apt5ON7Fe+dun5mBek9VkrS3zmM1NnqUo4H993Y+LWMltJ+raFwW6shP/b3G+OlFGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAmi7LK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAmi7LK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC2C1F000E9;
	Tue, 18 Aug 2026 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787036470;
	bh=A4W4aBHAZSgHGfphuFUB0RcioFOEHtGqGft7qgQ5dIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lAmi7LK/TYUYni8ULrzkEOtyWrsLHETUCnopcaFKf3WDWwgHkLZzV0q6Zmmv0D304
	 vNTqbujYPaY8ggQvAHY0oQZtLxmrSftzQGLnJlzusSzFmoRUPxWqxVczCpAEg2UlG5
	 XZqDPn+EeS7STPmbgw3O5ufG7Rb/UHVT36qUTI4ghnSwZbdtFmfIOVDuHgG3vHCWGC
	 DNIYmkTMggvLlsmWg01BuIbReKgUGncU6Mjz80OE74QsVEWRc1TcFjn5XU36AB6MQO
	 8WuA51lefNxrqluc7QHp0etWStWHEx1k5Juck8sWvgPtUlPldpQQfhy8OZTRG5RN3w
	 8CE6CGccNZkpA==
Date: Tue, 18 Aug 2026 09:01:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Message-ID: <20260818-convivial-manatee-of-jest-acd3f6@quoll>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>

On Sun, Aug 16, 2026 at 12:23:00AM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Note: Running dt_binding_check on patch will yield a warning for
> 'ti,keystone-reset' in the example block. The YAML conversion patch for
> that child node is already in progress here:
> https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
> ---

You need to send dependencies together, either in patchset or even one
patch, depending on the case. If this has warnings then it cannot be
applied.

Best regards,
Krzysztof

