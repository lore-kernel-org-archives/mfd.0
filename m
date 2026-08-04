Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F274734E2;
	Tue,  4 Aug 2026 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859293; cv=none; b=i02yp3zh22oNIIbdWrhu93oNJGWjy3ki3N9Ug1I3yvhsul9HjaK19VLcdRSFO6ckhjnmSgN+e8Q7+7N6iilngAjhG32XzlmKOIWJMD2lU5+wrSng9/EAj8T/mlfSfHu3yglYtnq24wozm+GUNcB3UslExN4QnkKvaqJJ36+Zy2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859293; c=relaxed/simple;
	bh=5NQIbXl5c5PV0Woqhs2RccY2SqUcdKflfQPaSDOedL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D5tI8RPvjPTbrCA2/XpYOJnZljSjSFLBB7quab6/SFDoDOVKmd6UtoPx3W8YgxKjoHbnlcvrnHnEgkSzHUdHL8S+OaoVnREH26TJ+hyRjCWWKJX6gxvwm0nU3fitKTG6pjG55eqABOAzMgNfUekOqX4i6Ss2c3cTgc/k2EeZqC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1gJpn3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1gJpn3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D611F000E9;
	Tue,  4 Aug 2026 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859291;
	bh=oNIA3dJpHkFEdpDm2SkLi1/C4QV+hDgFnj2LCc/kvUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N1gJpn3sCWf0kECqtwkyUyGiBiEYosD2iJIkGTQcJY5KFvt7d6MBgholzA9aG1r2F
	 7k8d0zzG5Xxm4zHzOtuovj5SSra3gOlKFOPJUqheN/0s6qePiAf+TZ+u8aMYVENquh
	 hXgG5SQzpvIgffhbpPRy8yxs+dJiCOU8GBl7V3zX5MHheZaM5ywifXUwNZuaLjOdRF
	 rNw0T5x7b+KVfvC1O1JlWHxufg3Z4vM+NKtXrcoUeuYKPZxjYOuwMggy0t+j1LvU7d
	 wb3/7pqI32qDFwruPE1ZAsfT9u73OhftDXoI2rKqmM8c8z4QuKiXDXMSxDF3tB44Ud
	 qQwy6zatmfghA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: mfd: rohm,bd71828-pmic: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-mfd-syspower-v1-8-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-8-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:01:31 +0000
Message-Id: <20260804160131.90D611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree schema references a missing generic schema file (`/=
schemas/power/power-controller.yaml#`), which breaks schema validation.
--

--- Patch [8]: [PATCH 08/10] dt-bindings: mfd: rohm,bd71828-pmic: Use gener=
ic power-controller schema ---
commit fe53293ad6a768dfc275a4c74e7fe894633d1720
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: mfd: rohm,bd71828-pmic: Use generic power-controller schema

This patch updates the bd71828-pmic binding to use the generic power
controller schema. It references power-controller.yaml, removes the local
system-power-controller property, and switches additionalProperties to
unevaluatedProperties.

> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml=
 b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> index 09e7d68e92bf3..9818102e02c75 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> @@ -15,6 +15,9 @@ description: |
>    single-cell linear charger. Also included is a Coulomb counter, a real=
-time
>    clock (RTC), and a 32.768 kHz clock gate.
> =20
> +allOf:
> +  - $ref: /schemas/power/power-controller.yaml#

[Severity: Low]
Does this reference resolve correctly in the current tree? It appears that
power-controller.yaml has not been converted yet, and only the original
power-controller.txt exists in Documentation/devicetree/bindings/power/.
If the target schema file is missing, dtschema will be unable to resolve
the reference, which causes schema validation to fail when running
make dt_binding_check.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D8
