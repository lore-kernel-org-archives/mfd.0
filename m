Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34C3769E0;
	Fri, 14 Aug 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690204; cv=none; b=mN7iT+aVIHkZvDZm0ClWtgkch9MlblOdNcc/iymLScaP8Wbs/Oy7LI+gErtF48MXnTOjrHhLZSZMcxJz7c+LaFlo/tJpv8w1N4HGPLypnFuquWvMMObukNx3ryRv0hyBfOWdnFSSsTTF1mY6LHOvs8oMnZPUJ9yw0JYc7MCYinE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690204; c=relaxed/simple;
	bh=T3uGTV5WI3V4/Y5gkA0VRrbhrbY2JhqbwDMPdi3EtJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7ofcoLW8GODK1aOhOjzQUmfkcoABgJjnsQMQRdZ1ZqjLyjeMxa8ZTcKF3e91Nw7DhwWR6hBjGTN6wYm4by6F1dKDVZtzmHU8WeInUyOCOzys9QAXVHEX8AERpQeUATS8DF5hPtecz6HTBtJVzsAOvNeA3Jh1aYOQmx0RhR8TTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5MwQSQE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5MwQSQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DB71F000E9;
	Fri, 14 Aug 2026 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786690202;
	bh=GO7u1XyMdAqlxZ/o8hlB37t+KyCDfa8dCUlOtLxSEr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q5MwQSQEQuRuVChoIsnpQlDWBw9kMRCiIP+MC9Eux/NLBImTmJ0Rj+3HFiGJCoA1b
	 5TXaVvQF6TdZ1d9s1t4mfZ0wTSCFDHJjTB33TxDZ0HOXGIPw4Wsep7FnAFZkpIXQas
	 3RLhUICWJIyjw0f8Z4fNhXPglp7r1SjsMDKt7WQFilIA+so3ffDxEXLQ3hBjdKvy4W
	 jTYLIAaY7RjlVQ+xdyVnDTgWfpUAUVtu8SSXa0T2CciGKEJIwp3XSmtOCU/L+hFbsB
	 kFeXifyDIyrMSkvRTMP7VtWqh65uBUqVxU4RV+kpjfykTIa7O5C0FtuWEj8ASIl/2p
	 /LeKf/vCRj+FA==
Date: Fri, 14 Aug 2026 08:49:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT
 schema
Message-ID: <20260814-brilliant-real-moose-e4158c@quoll>
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>

On Thu, Aug 13, 2026 at 10:03:53PM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Added "simple-mfd" to the allowed compatible strings.
> - Enforced child bus properties (#address-cells, #size-cells, and ranges)
>   to be required only when the "simple-mfd" compatible is present.
> - Added patternProperties definitions to validate standard child nodes
> - Updated the examples to demonstrate simple-mfd parent usage and updated
>   node names to conform with standard Devicetree specifications.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Note:
> Running dt_binding_check on patch will yield a warning for
> 'ti,keystone-reset' in the example block. The YAML conversion patch
> for that child node is already in progress here:
> https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
> ---
>  .../bindings/mfd/ti,keystone-devctrl.yaml          | 105 +++++++++++++++++++++
>  .../bindings/mfd/ti-keystone-devctrl.txt           |  19 ----
>  2 files changed, 105 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> new file mode 100644
> index 000000000000..33a72c290fb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments Keystone Device State Control
> +
> +maintainers:
> +  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> +
> +description:
> +  The Keystone II devices have a set of registers that are used to control the
> +  status of its peripherals. This node is intended to allow access to this
> +  functionality.
> +
> +properties:
> +  compatible:
> +    minItems: 2

Why? Where is it explained in commit msg?

> +    items:
> +      - const: ti,keystone-devctrl
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^keystone_dsp_gpio@[0-9a-f]+$":


Incorrect names added without explanation.

Best regards,
Krzysztof

