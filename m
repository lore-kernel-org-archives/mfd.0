Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978543F4CD;
	Sat, 26 Sep 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427189; cv=none; b=IKOIDCOgTo0xn/cpEewy7gZ6i6Afbx/AW4NbwjIaieh9CeQQsp/I5ieD0Vt92ztOY+rgVSRqMao/bz+sMs1eHowLsqb+jJimztPpvg2ZJFLmOYI75s3XHwkWC7U+aC+bz7+uYuFcZqeggbdVPCnPb6Z+GPR/cAKdv5dpKmFc3ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427189; c=relaxed/simple;
	bh=iBpx6LhyM29HLjG/rcrcAFR2HF9yIPTpiMooZqE7Lx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1yVaVYEXF9ba1FooSbIs9fK6YOucui1NyT9kFCndA5Lpij+2T25otbONsZUwxXOsSy/rYK+7VcIAT9PfwZwm+NJLIu6omyxGHDquPL/wL1ArXl7cjXxrFJRPVnYqi60XXWgA6ASsQEaeYihIksjgtHq5Q1+3JUcC8nIjGaJBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXbljEXm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXbljEXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957881F000FF;
	Sat, 26 Sep 2026 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790427184;
	bh=L0UOZYLdRbBS2sOxwulGEEVDjvCOGAj5qF50ZbgWhhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XXbljEXmLtPh7Zbb5xzVdT2xjHlKAz6JDIXvHlna7CAj2kYGewFZ6INobffWjJX4C
	 BMfkTRSJBP7Hz7/u6Yq/i97J2RqaIWOMhIGVidYEbm51gAYZo+xDzwoC1YzabYXoMo
	 KX0xTlFrgwdhbeuaoisGjQkLkt46AiNMOu5KKYE8mOBvKFJAHKCfZko/v0WISgsejZ
	 l9e2HjLDu6dG3mukS4ubrMYdxHpR7DejaP2rx0vT9nVe3AaJKV1hvgbzAqtH8krmG4
	 80qax7mZR1Vsxzwya1jC7h91aQom/h3YYR6XcWKOmRYorwr5M+34zgwDbDaUBe+qy0
	 lYi2SMXUQ2Uag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:53:03 +0000
Message-Id: <20260926125303.957881F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: typec: qcom: data race on port->tcpm_port causes NULL derefer=
ence
--

commit c724ae85ceb0ca42ea62d9d3f8a3d994453a3cf9
Author: David Heidelberg <david@ixit.cz>

usb: typec: qcom: Add gen1 Type-C port support

Add a port backend for the first generation of the Qualcomm PMIC Type-C
block, found on PM660 and PMI8998.

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c b/dr=
ivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c
> new file mode 100644
> index 0000000000000..b4e3e49664f9d
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c

[ ... ]

> +static int gen1_typec_set_vbus(struct tcpc_dev *tcpc, bool on, bool sink)
> +{
> +	struct pmic_typec *tcpm =3D tcpc_to_tcpm(tcpc);
> +	struct gen1_typec_port *port =3D tcpm->pmic_typec_port;
> +	bool changed =3D false;
> +	int ret =3D 0;

[ ... ]

> +	/*
> +	 * set_vbus() may run during tcpm_register_port() before port_start()
> +	 * provides tcpm_port. Once registered, notify TCPM whenever the
> +	 * source regulator actually changes state. get_vbus() also accounts
> +	 * for vbus_enabled when GEN1 does not reflect sourced VBUS in
> +	 * TYPEC_VBUS_STATUS.
> +	 */
> +	if (changed && port->tcpm_port)
> +		tcpm_vbus_change(port->tcpm_port);

[Severity: High]
Could this sequence lead to a NULL pointer dereference if device teardown
occurs concurrently?

It appears port->tcpm_port is evaluated outside port->lock. Without
READ_ONCE(), the compiler could emit a double fetch (TOCTOU) here.

If the TCPM worker thread (driven by external cable events) executes a VBUS
state transition concurrently with unbind, the pointer could become NULL
between the condition check and the function call, causing
tcpm_vbus_change(NULL) to crash.

[ ... ]

> +static void gen1_typec_port_stop(struct pmic_typec *tcpm)
> +{
> +	struct gen1_typec_port *port =3D tcpm->pmic_typec_port;
> +
> +	disable_irq(port->irq);
> +	port->tcpm_port =3D NULL;

[Severity: High]
Is it safe to clear port->tcpm_port locklessly here?

During unbind, qcom_pmic_typec_remove() calls gen1_typec_port_stop(),
which executes port->tcpm_port =3D NULL without holding a lock. This appears
to be what creates the potential race with gen1_typec_set_vbus() shown abov=
e.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D6
