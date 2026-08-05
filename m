Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4880331E85E;
	Wed,  5 Aug 2026 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933206; cv=none; b=p97qNXjJBUTpMY0sHODR0wDuzkQCm0NyqF/kzqYdQC3ZyNOXqPi+BlqT0bs7RqQtFzvOfA5nqt/S7SgjT/uFheG2rCcglJ9yqwZZx+wmLduvGyqx4+9Z+mHWGIbltsbGUZ+dt+6Pfb+r4SGu4blh+6gFSC3jDOQ/uqYD0sUhohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933206; c=relaxed/simple;
	bh=TsE38T13savo1ajeOgUX0qddGARD6RZ8Om8hj8hz9t0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UxKVkgsNIT1cYiJNDnXOXqMkFmqa+xe/uF71TF4xrv5nP19eOHMdwyNHpC8Z92fBh7SfRxdUGuPsSd9TYjDiotIIlyC9iZ7WBwqYSHZv9t+baVI65XpzRqThwTPkhMgvnIeDZufRSuDFKCIN7PEbjhMi433IUZHfnsIoWSoBaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IANzSCKK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IANzSCKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C09C1F000E9;
	Wed,  5 Aug 2026 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933204;
	bh=Lc/naDNsU/D1QPQSaEzw03goYbjKbSjk9J668VclLls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IANzSCKKlxAUIcYXMFExc+YqTDOkxv+wHNvyU9k7HQNth1doKBF5RWIW738ybmxaQ
	 z3+Tdanp1vVTB/NbogPgR6dM1ub/vGavdtsZB9kzhMmeks7WHkD/CrIg6qypQuTNT3
	 IIYHo1gnnh1/liBa4VzG+n2HNupkVnvc1ERT3J230ceO+4sOtBfoSgdvlAzQPn1a8d
	 pVI8sjJeMvX9CwNifC3/VLv9LBVTNnTGHQyilF/RTrOjgekwDxIsLJYMe1nFhZwwkQ
	 9cirCPVpmtlQmt6il68WeALRdwuSa/Gwtqm3XXWYhxPXwZXLwXv/6S20TBKhLCpKsM
	 VG9KiL/Ejk2Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] serial: 8250_aspeed_vuart: add VUART over PCI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:33:23 +0000
Message-Id: <20260805123324.6C09C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The FIELD_PREP macro is used without explicitly including <linux/bi=
tfield.h>.

Pre-existing issues:
- [High] Probe error paths fail to unregister the 8250 serial port and dele=
te the unthrottle timer, leading to a Use-After-Free when devres frees the =
device memory.
- [High] Incorrect timer deletion ordering in `aspeed_vuart_remove()` allow=
s the timer to be re-armed on a freed object.
--

--- Patch [3]: [PATCH v5 3/6] serial: 8250_aspeed_vuart: add VUART over PCI=
 ---
commit ff31cbc0cdc941ba791069ea924a94d8ad864389
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

serial: 8250_aspeed_vuart: add VUART over PCI

Enable the VUART over PCI for the AST2600. Activate it only if the
aspeed,vuart-over-pci property flag is set on an
ast2600-vuart compatible node.

> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 6afa2f4057e1b..2360d37139bfa 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -32,6 +32,28 @@
>  #define ASPEED_VUART_DEFAULT_SIRQ	4
>  #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
> =20
> +#define ASPEED_SCU_SILICON_REVISION_ID			0x04
> +#define AST2600A3_REVISION_ID				0x05030303
> +
> +#define ASPEED_SCU_PCIE_CONF_CTRL 0xC20

[ ... ]

> +#define ASPEED_SCUC24 0xC24
> +#define  ASPEED_SCUC24_MSI_ROUTING_MASK				GENMASK(11, 10)
> +#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1 \
> +		FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)

[Severity: Low]
Does this file explicitly include <linux/bitfield.h> for the FIELD_PREP
macro? It appears missing, which might cause build failures if implicit
inclusions change in the future.

> +#define  ASPEED_SCUC24_RESERVED_14					BIT(14)
> +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN	BIT(17)
> +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN	BIT(18)

[ ... ]

> @@ -540,6 +622,15 @@ static int aspeed_vuart_probe(struct platform_device=
 *pdev)
>  	aspeed_vuart_set_host_tx_discard(vuart, true);
>  	platform_set_drvdata(pdev, vuart);
> =20
> +	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
> +	    of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
> +		rc =3D aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
> +		if (rc < 0) {
> +			dev_err_probe(dev, rc, "could not enable VUART over PCI\n");
> +			goto err_sysfs_remove;

[Severity: High]
This is a pre-existing issue, but adding this new error path exposes it
further in aspeed_vuart_probe().

If we jump to err_sysfs_remove after the UART port has been registered via
serial8250_register_8250_port(), does this path fail to unregister the port
and delete the unthrottle timer?

Since the vuart structure is allocated with devm_kzalloc, returning an error
here will cause devres to free the memory. Could this leave the 8250
subsystem with a registered port containing a dangling pointer to vuart in
port.private_data?

> +		}
> +	}
> +
>  	return 0;
> =20
>  err_sysfs_remove:
>  	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
>  	return rc;
>  }

While reviewing the lifecycle of the vuart object, I also noticed another
related issue in aspeed_vuart_remove() which is not modified in this patch.

[Severity: High]
This isn't a bug introduced by this patch, but does the ordering in
aspeed_vuart_remove() allow the unthrottle timer to be re-armed on a freed
object?

Currently, timer_delete_sync(&vuart->unthrottle_timer) is called before
serial8250_unregister_port(vuart->line). Since the serial port and its
interrupt handler remain active during this window, could an interrupt arri=
ve
and trigger aspeed_vuart_handle_irq(), calling mod_timer() to re-arm the
timer?=20

When aspeed_vuart_remove() completes, vuart is freed by devres, and the
pending timer could subsequently execute and access the freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785932211.gi=
t.gregoire.layet@9elements.com?part=3D3
