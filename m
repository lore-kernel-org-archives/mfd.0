Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204B420471;
	Mon, 17 Aug 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972955; cv=none; b=ShiqkzmKf7zCOGAyLjwA+WBiJxQUIrW3qyBJrcU29SMTvF4tfMVBnJY5kpTcKnfx607+4Fa45uqcUq4L8FywC8Ovg+i6O3LPONn2WoTgQUOd0wmRajaNDe7KOmfoUl3pYslNtWUGctfDScWGkMorLeJ8vcNEEhwDCQHt1XxBMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972955; c=relaxed/simple;
	bh=zgJdsXExSOCUEDe9rB5rUHC+NV6L8z0MXEiqLfR5qN8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mBv2IY5XVEkJuHPiNe3TTNlbjMhQ7o4EXOJgnHR3PIECzOJRmfq50Fa6y7vdERupiLW6iyWQOaSxIj7GTQSJMkASuZc491YlOTS5PWO+dgtzTsDoXhcnruVhxhs/MZOVMtzMng3e7L8k7hERxDedR6J2RnydyNbiND78Tq9SnvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1HidAbu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1HidAbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1256F1F00A3E;
	Mon, 17 Aug 2026 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786972949;
	bh=Nx/2JiOqz/x+w6M8U7ObPZ69yW2KHjw5AdqyjeYqdZU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=e1HidAbukOVKdxgQJFMcqBVJrXipGGKVLpHJrISDDBU9xvC0qdt/SpaT+DKw8rBYq
	 DjSO/IBbOl2mgVZTD9bzPJ32Vg5UnQ+snCrok4tte3Q+McAoF2ZFeUjQhg8s+wWqD9
	 4e2tIpnWwGQdbVjxmzS/mmHSGWX9Ovj3FzUGJc0YyEYBhQTDUiC9LbYOmyMT79IgEa
	 ywVmga32zT7qWPzOiFhsVvDDNRiY51q7dM1lfim8vXQSjSKpP3drLGpY0VHRIqPTPb
	 N0WGzz2RxbjcLxLc7JXM9QuxDBqb8GjIfBf43/l2aXZM4JRC82bAngbrQbpPFsq6Bn
	 YYTz78Fl4b3mw==
Date: Mon, 17 Aug 2026 08:22:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: daniel.baluta@gmail.com, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, goledhruva@gmail.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 simona.toaca@nxp.com, devicetree@vger.kernel.org, m-chawdhry@ti.com
To: Bhargav Joshi <j.bhargav.u@gmail.com>
In-Reply-To: <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
Message-Id: <178697294672.115607.1502530861180483583.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert
 to DT schema


On Sun, 16 Aug 2026 00:23:00 +0530, Bhargav Joshi wrote:
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
>  .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
>  .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
>  2 files changed, 84 insertions(+), 19 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.example.dtb: /example-0/device-state-control@2620000/reset-controller@328: failed to match any schema with compatible: ['ti,keystone-reset']
Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.example.dtb: reset-controller@328 (ti,keystone-reset): ti,syscon-pll: b'\xff\xff\xff\xff\x00\x00\x00\xe4' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml
Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.example.dtb: reset-controller@328 (ti,keystone-reset): ti,wdt-list: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

