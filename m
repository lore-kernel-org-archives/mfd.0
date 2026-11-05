Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877778;
	b=FsamE3lmu3Ulv0GsnPhIH1F+DlWeZkBlEjaMiywNwGGusvgdmMLjqXolAOsp0JAcTFlK
	 ZRmCQ4+2pKhgAzuQqeYNSLgJpG/y1quoUuxobfTRHhzJUvVEZXIbz3lxlLdCZ1nD1hp6B
	 sRYly6TaWtqB70FC29thKtxo2m1lVbOSwX1ChP+r4LrdljlajeTvTI7Q+BGvs4F4b4V+1
	 0cnnAnCBJsLQZsYB1GKBJPnJ+l8sMUWQGd2yM87DfheumOkTlg06lgVj/Ykqs5UjMBRLv
	 xubF/KBe6Q36jErF6pZtdxW0RYBPgtBomP7SSiw36n3UTsdjQhvh62+6BgtXEVh/Ouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877778;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SPgx0huVG4QqGbl+29lNRc2AVOIcsgZs39dvTc5R99k=;
	b=iU6YgR5Wa+KB+esAXGuwASgoiLPa0CPrMHA9EfVDUWnbDVHui33bE2O1YLfFfGyXc8KH
	 qAS2KZM4ga1SB3txW7o0/7+uxdJ2JomKqAYvUATFo8ZZAWy83EUXvZac4l1vGhV1dS5o5
	 du2XaiPipuTE1xmL9csUQyVqLcrXiNL5u2NCUu3j8VJVP5+N872pPBqrqaJkYZpXcP/iC
	 Sqmz3ZTfrrQEUYIsp1gN2e1WVnNMPjIOPdGLT2kEArxpE4RGFO5JmVDenfpitNYRMIJb9
	 sTM+gKXFC1o82OyQTAcEQww5lKpFr3XrIGdowWzkVmJ5x9vtxopJELWUDATdkK/uyJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG6tW8mT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58786606A31B;
	Thu,  5 Nov 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG6tW8mT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE70B1F000C1;
	Thu,  5 Nov 2026 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877778;
	bh=SPgx0huVG4QqGbl+29lNRc2AVOIcsgZs39dvTc5R99k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JG6tW8mTK58hRuD1CwOUSLfj+pSihr6Y0M+mEAAcR4JBnaCdm0bkrrSNXPQDAxghK
	 4UDno6rQh+KSxSU+C2GDkux6/IsUo9VCen4Ug8K6M31p4K0u+EikufwZxRnUW6Leck
	 Qy2kehxzZdkxioykRHsMF1YmvavcJcrjM3s7u2/YTz9WmeJ8NP9v1AHMkSMUsCuM80
	 mSKBqb04IV4ZEmEBAbE8w+i9Viz2DPa9ZZcoNFskLiTUiTi+H230qtc4sfAuFN5i17
	 tP8g5sq9kp+3uMmdDIsE8QVEC4HpJ8Ao4b6U4ezFJIdWBtBFNVwH757tP2N/I1uAxV
	 TuB1mZB2zPktQ==
Message-ID: <sashiko-outbox-198941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/3] dt-bindings: i2c: qcom-cci: Document Nord
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261105-ccu-v1-2-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
 <20261105-ccu-v1-2-3accc4b901de@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:22:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: i2c: qcom-cci: split unwieldy per-variant schema condi=
tionals
--

commit 462fd62ad81784bc39c8c1fb16b33e4aa1f4c6be
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

dt-bindings: i2c: qcom-cci: Document Nord compatible

This commit documents the qcom,nord-cci compatible string in
Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml, along with its four
required clocks and the new qcom,ccu-mux-sel property for configuring the C=
CU
wrapper output mux.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec..5a25ebe0e61f6 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,glymur-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
> +              - qcom,nord-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>                - qcom,sa8775p-cci
> @@ -70,6 +71,20 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  qcom,ccu-mux-sel:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      On SoCs where the CCI sits in a CCU wrapper, the CCI I2C ports are
> +      routed to the CCU after reset and the CCU output mux has to select=
 the
> +      CCI before any transfer.
> +    items:
> +      - items:
> +          - description: phandle to the Titan CAM_TOP syscon
> +          - description: byte offset of the CCU output mux register in t=
he
> +              syscon
> +          - description: mask of the mux bits of this CCI, set to 1 to r=
oute
> +              the I2C ports to this CCI
> +
>  patternProperties:
>    "^i2c-bus@[01]$":
>      $ref: /schemas/i2c/i2c-controller.yaml#
> @@ -131,6 +146,32 @@ allOf:
>              - const: cci_ahb
>              - const: cci
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,nord-cci
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Camera subsystem top AHB clock, needed by the=
 CCI
> +                register interface and to access the CCU output mux
> +            - description: CCI core clock
> +            - description: AHB clock of the CCU wrapper the CCI sits in
> +            - description: Camera subsystem top fast AHB clock
> +        clock-names:
> +          items:
> +            - const: ahb
> +            - const: cci
> +            - const: ccu_ahb
> +            - const: fast_ahb
> +      required:
> +        - qcom,ccu-mux-sel
> +    else:
> +      properties:
> +        qcom,ccu-mux-sel: false

[Severity: Low]
Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml already contains
eleven per-compatible if-then blocks under allOf to handle variant differen=
ces
in clocks, child I2C buses, and power domains.

Since qcom,nord-cci sits inside a CCU wrapper, introduces a variant-specific
qcom,ccu-mux-sel property that must be disallowed for all other compatibles,
and uses a distinct four-clock configuration (ahb, cci, ccu_ahb, fast_ahb),
would it be cleaner to split this binding into separate schema documents
rather than adding a twelfth per-compatible conditional block here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-ccu-v1-0-3=
accc4b901de@oss.qualcomm.com?part=3D2
