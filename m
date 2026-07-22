Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA5933939A;
	Wed, 22 Jul 2026 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717699; cv=none; b=F6x3GeszqPGaLkWnN4hX1Vu6gSGUVUlmQ+jfWUaUBPAjrqhuKPuesobjw7ieotnmuXPEfSQ6ED7QngXQbHlP/rLSZUyvGjWEMqKqisH3wYwUWu9jouyQfW62OwZV6YtnlB0lAb4mlBskextDBSneBtJjFot4wUzl27JUpF0Kib0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717699; c=relaxed/simple;
	bh=cvbfXlIv8rFqB+GO1+q1LECbw63cl/F3L0fC6SfOQqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UR/iRFZXFvPu2kKPlSVDRLYA9TXjRHqXcAmEqKtQH3PP7eOyRKHl4vamqSSjO2Fr/Wn1ppEcmYzGI4dnHTCA771Moya5Vf+huOPBV3dr0OfZCaiCKf7arW4e5eOq+i6Q1Xyo6OVPLloDr7M3KhroXQ6hTAeyZ2TmK7hm8RCJBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhJibyiU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhJibyiU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927B21F000E9;
	Wed, 22 Jul 2026 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784717698;
	bh=gtVmEfvwq4/pD5GtcvxNqUb0ue+/73zoOq3jfiqz1So=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MhJibyiU3NRlQ1LiaijI8/nt/TfLF1Q3Uxcx5wQpg5q0hDZeClXaSzA1GgDNdzXYY
	 Oaa5JoZiGtdgS7IvPYC7ulmqF7+2LoDLQ+towEQIcplOErwGL+WtOxABLl4UT5+3Q6
	 klg+5TmcaeXnWLp86823X8GCZXAxGeC24ViWsooKysqD61ORnsTvDAJrTLIg6Yu4RB
	 S8M0WP7dXWoNs+M5GTl8TKozgNUNeMQG/AtOopdjESuS5eioihW9QhWNSQxl0eorSM
	 D/3uSYzKnldUQxHvbFN4V76apjND1V4iAcxXfzGbiDpuyy0baB65lWvybURHDD4oZy
	 XnTt78aAGBpAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sachin Gupta" <sachin.gupta@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-spmi-mbg-driver-v3-1-ef73064f2789@oss.qualcomm.com>
References: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
 <20260722-spmi-mbg-driver-v3-1-ef73064f2789@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 10:54:57 +0000
Message-Id: <20260722105457.927B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The generic `^temperature-sensor@[0-9a-f]+$` node name pattern i=
n the SPMI PMIC schema is exclusively bound to the `qcom,pm8775-mbg-tm` sch=
ema, which causes validation failures for other thermal peripherals (like `=
qcom,spmi-temp-alarm`) that use the standard `temperature-sensor` generic n=
ode name.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: thermal: Add Qualcomm MBG therma=
l monitor support ---
commit 0d6b48e0b8d3e826b0476c17d69e98ce1c6de883
Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

dt-bindings: thermal: Add Qualcomm MBG thermal monitor support

This commit adds device tree bindings for the Qualcomm Master Bandgap (MBG)
temperature alarm peripheral found on the PM8775 PMIC. It supports both hot
and cold threshold monitoring with interrupt status reported over SPMI.

> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/=
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 809be2756a0c0..bd77cb7173e26 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -194,6 +194,10 @@ patternProperties:
>      type: object
>      $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
> =20
> +  "^temperature-sensor@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/thermal/qcom,pm8775-mbg-tm.yaml#

[Severity: Medium]
Will this exclusive mapping cause validation failures for other thermal
peripherals?

If a device tree uses a standard temperature-sensor@... node name with a
different compatible string (such as qcom,spmi-temp-alarm) under a
qcom,spmi-pmic node, it seems it would incorrectly fail dtbs_check validati=
on
because it is strictly bound to qcom,pm8775-mbg-tm.yaml here.

Should this pattern property use a oneOf block to permit any supported
thermal sensor schema, rather than binding the generic node name strictly
to the MBG schema?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-spmi-mbg-d=
river-v3-0-ef73064f2789@oss.qualcomm.com?part=3D1
