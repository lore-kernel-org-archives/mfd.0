Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B894E23392B;
	Wed, 23 Sep 2026 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145574; cv=none; b=W3KyeHr2AEBZgz+/M0M+jVKl1XfKWF2QR4hp1sFCV+CXx+VPc+9T1zFG+nMJpM1aQpo1oIspAwyROi2VhTYuQ/Q1QMVhyoDKjSeuq59kqSACtWGdkcg9V82mw4RTYnacuui3209nnJ7pDT4CdHe502PlT6R+o7BU0Vb6/YxB+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145574; c=relaxed/simple;
	bh=+I0vc7x0ElKdYA7CgOJ6FVU1d7HtcCRO8oddZDbuQ+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rTo0Sd6T95l/MPFeqaLB8JTSV/WHg6anIhG0VgnwRNDHF/HjyLVlxkfV5jZKzV/YhvYu4OpRco9Xnx/TwgfGHKKy0Cs6fYu4bz1umOiedbMqaF5/5NjCb2fvi7uNBInR39g94bypAzrWjMuzV0oIHq7iqsqg8QfmDHTRglacuCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXGVy0uB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXGVy0uB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2142E1F000FF;
	Wed, 23 Sep 2026 06:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790145568;
	bh=ZImzNM5xnnr2nQFqCUc4w7ithMom07a0Av/7PMBmLVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IXGVy0uBIRVJ6kUYUMh7dd3a4+SMnu/tE2Pw6eva2mTFQuEmc+RBE5/WaQtEUIMC9
	 4ngIn0DbOpyRp0YHoGWo6G+hLcpLc+yZxLGHvWJ3p6Y3feujIVlhFqr+qewhjaAYt6
	 o1ak18IK/tGqFw8sGSfslQsBeNXWERdoGMpwRnn9UzeuAcCgbN+RxCGsCPt/my5z6y
	 UGA8EYyq13dyDbESdx5yqJ67gPkiDIBxnHX6UP7yay7XNaYjKxMmLtGpE+4NLxeIml
	 quxiulBX+tWwng91KGKmEqil0rWVBpsFZKEl48OhhAoiFVCz6lyKRSTo3+m1T54Hfh
	 ndQLmAA2okkBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert rk805 pinctrl to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923062746.516666-1-quchaosheng000406@163.com>
References: <20260923062746.516666-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 06:39:27 +0000
Message-Id: <20260923063928.2142E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt-bindings: mfd: DT ABI breakage for rk805 pinctrl container node
- [Low] dt-bindings: mfd: missing driver prefix in commit message
--

commit fb35b4123e96d1c068df56e50d1eaaf6204d1a23
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: mfd: Convert rk805 pinctrl to DT schema

This commit converts the pinctrl binding for the Rockchip RK805 PMIC from a
standalone text file to a YAML schema integrated into rockchip,rk805.yaml. =
It
drops the standalone text binding and adds a child node schema for pin
configuration nodes.

Link: https://sashiko.dev/#/patchset/20260923034245.396417-1-quchaosheng000=
406@163.com?part=3D1

> dt-bindings: mfd: Convert rk805 pinctrl to DT schema

[Severity: Low]
Does this commit message subject violate the MFD subsystem naming conventio=
ns?

The guidelines strictly require the prefix format:
mfd: <Driver>: <Capitalized description>

The driver or binding name component (e.g., rk805: or rockchip,rk805:)
appears to be completely missing before the capitalized description.

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> index da2391530c16c..681a90a265c06 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> @@ -86,6 +86,34 @@ properties:
>          unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
> +patternProperties:
> +  '-pins$':
> +    type: object

[Severity: High]
Does this pattern restrict child nodes to only those ending in -pins,
incorrectly rejecting the legacy pinmux container node?

Device tree bindings are considered kernel ABI, and schemas must validate
existing correct device trees. The original pinctrl-rk805.txt explicitly
documented a nested structure where a container node (named pinmux) held
sub-nodes (e.g., gpio01) containing the actual pin configuration.

With the new YAML schema setting additionalProperties: false at the top lev=
el
and restricting child nodes via patternProperties to only match the -pins$
regex, existing device trees using the valid legacy pinmux container node
will be actively rejected by dtbs_check because pinmux does not match
-pins$ and is not explicitly defined in the schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923062746.5166=
66-1-quchaosheng000406@163.com?part=3D1
