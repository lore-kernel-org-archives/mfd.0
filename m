Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF5B4D6C5E;
	Sun, 18 Oct 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340892; cv=none; b=IsldyrDpdlaLMgQBW+pZS9IMjg+RCh30bujZkkk8vOO09MX/zep+2JNfYBHXUFPvMriecs3SP1XPp+0QTQWto7gxIDV4QL9ji+R4C/8z7UpvKER6tdonzhAqJguBjl0CvTPLg3lolJK87bepWeNTOtUbMJCZXFrQRcU1jVkh1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340892; c=relaxed/simple;
	bh=/fPkB972yRcYRWVfZvsI0LhTcchbOpPO9A1nN6FRKik=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eAOroagR4xM2x+z9xsd3ZNl8T1cQlq8XH8UIW+CvJ3SQfH/2tbd6aV+X7LKxNSAAiYb3PSjPJAYqyrGO/VcGtcNxj3zmeOGltC193lilCB8Y+M9L5f5VVDdlmutnkVC7SbIRC+V57Tlpo3trcM6K6npTH5sb5PKn2/MAVYqiYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcIOwOx8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcIOwOx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCA01F000C5;
	Sun, 18 Oct 2026 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792340890;
	bh=ovBC+kkWVRI6fWSMkt81/yt8asvTLIiDL6HhP+2KnmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gcIOwOx81trGY+VxWxXYwLmBz5H+joA0bYQF+EYiemYGUNkPR121wVG7J5F5JQoyj
	 N8lQMeSBtKfmQJVlONxrq9z/OATYs2lhH1QKUuY9Znp8OfXI15tp3aQKQA7itpo0MD
	 3BlA8+4kL8AVudlKD8m27GY2uEVKEJ0GFFO1twN+B430vdbR56x91MZHvH8vGAL7F3
	 MfZsr1tYQFRn70hbU7C31RA00bpUAzBoYztoNkgTV04UQ3/73F+th6eWU2FYBGGo8l
	 5ASS8I3zCgZt2opPMESqUBj+rcXBzNs2Mh/Ttea+L3OXuo8dUhJiMUmNOSFC9rselF
	 s2AucWuqRdx8A==
Message-ID: <sashiko-outbox-176278@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/8] irqchip/realtek-intc-common: Add basic support
 for Realtek DHC SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261018160653.3940371-5-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:28:10 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] irqchip/realtek-intc-common: Non-raw spinlock regmap used in hardi=
rq context
- [High] irqchip/realtek-intc-common: Broken level IRQ ack and unmaskable l=
ines
- [High] irqchip/realtek-intc-common: Missing irq_dispose_mapping() on tear=
down
- [High] irqchip/realtek-intc-common: Hardware interrupts not masked in pro=
be or remove
- [Medium] irqchip/realtek-intc-common: Unconditional ISR clear in suspend =
and resume
- [Low] irqchip/realtek-intc-common: Missing struct forward declarations in=
 header
--

commit 6cf821f34bf6b6377c2ded61f4b04bd1ec0308c3
Author: James Tai <james.tai@realtek.com>

irqchip/realtek-intc-common: Add basic support for Realtek DHC SoCs

This patch adds a common interrupt controller driver for Realtek DHC SoCs,
supporting single- and multi-bank configurations, shared status registers f=
or
direct-to-GIC interrupts, and wire-OR shared parent IRQ lines.

> diff --git a/drivers/irqchip/irq-realtek-intc-common.c b/drivers/irqchip/=
irq-realtek-intc-common.c
> new file mode 100644
> index 0000000000000..cc08535217bd1
> --- /dev/null
> +++ b/drivers/irqchip/irq-realtek-intc-common.c
> @@ -0,0 +1,353 @@

[ ... ]

> +static bool realtek_intc_dispatch(struct realtek_intc_subset_data *subse=
t_data)
> +{
> +	const struct realtek_intc_info *bank_info =3D subset_data->bank_info;
> +	struct realtek_intc_data *data =3D subset_data->common;
> +	u32 ints, inte, mask, val;
> +	irq_hw_number_t hwirq;
> +	bool handled =3D false;
> +	int irq;
> +
> +	if (regmap_read(data->base, bank_info->isr_offset, &val))
> +		return false;
> +
> +	ints =3D val & subset_data->subset_mask->ints_mask;
> +
> +	if (!ints)
> +		return false;
> +
> +	if (regmap_read(data->base, bank_info->scpu_int_en_offset, &inte))
> +		return false;
> +
> +	while (ints) {
> +		irq =3D __ffs(ints);
> +		ints &=3D ~BIT(irq);
> +
> +		mask =3D bank_info->isr_to_scpu_int_en_mask[irq];
> +		if (mask !=3D IRQ_ALWAYS_ENABLED && !(inte & mask))
> +			continue;
> +
> +		hwirq =3D (subset_data->bank_idx * 32) + irq;
> +
> +		if (!generic_handle_domain_irq(data->domain, hwirq))
> +			handled =3D true;
> +
> +		regmap_write(data->base, bank_info->isr_offset, BIT(irq) & CLEAN_INTC_=
STATUS);

[Severity: High]
Does clearing bank_info->isr_offset after generic_handle_domain_irq() cause
lost or duplicate interrupts with handle_level_irq()?

realtek_intc_domain_map() configures all domain interrupts with
handle_level_irq and realtek_intc_chip, which only provides .irq_mask and
.irq_unmask (no .irq_ack or .irq_mask_ack).

For non-threaded handlers, handle_level_irq() masks scpu_int_en_offset, runs
the peripheral handler (clearing the device interrupt), and immediately
unmasks scpu_int_en_offset via cond_unmask_irq() before
generic_handle_domain_irq() returns. Clearing BIT(irq) in isr_offset
afterwards can wipe out a new interrupt latched right after the peripheral
handler ran.

For threaded interrupts (IRQF_ONESHOT or forced irqthreads),
handle_level_irq() masks scpu_int_en_offset, wakes the IRQ thread, and
returns to realtek_intc_dispatch() while the peripheral's level output is
still asserted. Clearing BIT(irq) in isr_offset here happens before the IRQ
thread services the device, so BIT(irq) immediately re-latches in
isr_offset. When the IRQ thread finishes and unmask_threaded_irq() calls
realtek_intc_unmask_irq(), isr_offset is not cleared, triggering a spurious
second interrupt.

Should status clearing be handled via irq_chip callbacks (and when unmaskin=
g)
rather than after generic_handle_domain_irq() returns?

> +	}
> +
> +	return handled;
> +}

[ ... ]

> +static void realtek_intc_mask_irq(struct irq_data *data)
> +{
> +	struct realtek_intc_data *intc_data =3D irq_data_get_irq_chip_data(data=
);
> +	const struct realtek_intc_desc *desc =3D intc_data->desc;
> +	const struct realtek_intc_info *bank_info;
> +	int bank_idx, bit_idx;
> +	u32 mask;
> +
> +	bank_idx =3D data->hwirq / 32;
> +	bit_idx  =3D data->hwirq % 32;
> +
> +	bank_info =3D &desc->banks[bank_idx];
> +
> +	mask =3D bank_info->isr_to_scpu_int_en_mask[bit_idx];
> +	if (!mask || mask =3D=3D IRQ_ALWAYS_ENABLED)
> +		return;

[Severity: High]
What happens if an interrupt with mask =3D=3D IRQ_ALWAYS_ENABLED uses a thr=
eaded
handler (IRQF_ONESHOT) or is disabled with disable_irq()?

realtek_intc_domain_map() assigns handle_level_irq to all interrupts in the
domain:

    irq_set_chip_and_handler(irq, &realtek_intc_chip, handle_level_irq);

handle_level_irq() relies on .irq_mask to silence the interrupt line while a
threaded handler is running or when the IRQ is disabled. Because
realtek_intc_mask_irq() returns early without masking hardware when mask is
IRQ_ALWAYS_ENABLED, can an active interrupt on that line immediately re-fire
and cause an endless hardirq storm?

> +
> +	regmap_assign_bits(intc_data->base, bank_info->scpu_int_en_offset, mask=
, false);
> +}
> +
> +static void realtek_intc_unmask_irq(struct irq_data *data)
> +{
> +	struct realtek_intc_data *intc_data =3D irq_data_get_irq_chip_data(data=
);
> +	const struct realtek_intc_desc *desc =3D intc_data->desc;
> +	const struct realtek_intc_info *bank_info;
> +	int bank_idx, bit_idx;
> +	u32 mask;
> +
> +	bank_idx =3D data->hwirq / 32;
> +	bit_idx  =3D data->hwirq % 32;
> +
> +	bank_info =3D &desc->banks[bank_idx];
> +	mask =3D bank_info->isr_to_scpu_int_en_mask[bit_idx];
> +	if (!mask || mask =3D=3D IRQ_ALWAYS_ENABLED)
> +		return;
> +
> +	regmap_set_bits(intc_data->base, bank_info->scpu_int_en_offset, mask);
> +}

[ ... ]

> +int realtek_intc_suspend(struct device *dev)
> +{
> +	struct realtek_intc_data *data =3D dev_get_drvdata(dev);
> +	const struct realtek_intc_desc *desc =3D data->desc;
> +	unsigned int i =3D 0;
> +	int ret;
> +
> +	for (; i < desc->bank_num; i++) {
> +		const struct realtek_intc_info *info =3D &desc->banks[i];
> +
> +		ret =3D regmap_read(data->base, info->scpu_int_en_offset, &data->saved=
_en[i]);
> +		if (ret)
> +			goto err;
> +
> +		ret =3D regmap_write(data->base, info->scpu_int_en_offset, DISABLE_INT=
C);
> +		if (ret)
> +			goto err;
> +
> +		ret =3D regmap_write(data->base, info->isr_offset, CLEAN_INTC_STATUS);
> +		if (ret)
> +			goto err;
> +	}

[ ... ]

> +int realtek_intc_resume(struct device *dev)
> +{
> +	struct realtek_intc_data *data =3D dev_get_drvdata(dev);
> +	const struct realtek_intc_desc *desc =3D data->desc;
> +	unsigned int i =3D 0;
> +	int ret;
> +
> +	for (; i < desc->bank_num; i++) {
> +		const struct realtek_intc_info *info =3D &desc->banks[i];
> +
> +		ret =3D regmap_write(data->base, info->isr_offset, CLEAN_INTC_STATUS);
> +		if (ret)
> +			goto err;
> +
> +		ret =3D regmap_write(data->base, info->scpu_int_en_offset, data->saved=
_en[i]);
> +		if (ret)
> +			goto err;
> +	}

[Severity: Medium]
Does writing CLEAN_INTC_STATUS (GENMASK(31, 1)) to info->isr_offset in
realtek_intc_suspend() and realtek_intc_resume() clobber shared status bits
and wakeup interrupts?

As noted in the commit message, some peripherals have their interrupt lines
routed directly to the GIC while sharing the same status register
(isr_offset) within this mux. While realtek_intc_dispatch() filters by
subset_mask and isr_to_scpu_int_en_mask to avoid clearing status bits
belonging to direct-to-GIC peripherals, realtek_intc_suspend() and
realtek_intc_resume() unconditionally clear all 31 bits in info->isr_offset
and disable all bits in info->scpu_int_en_offset.

In addition, clearing info->isr_offset in realtek_intc_resume() right before
restoring info->scpu_int_en_offset will discard any wakeup interrupts that
latched during suspend.

[ ... ]

> +int realtek_intc_probe(struct platform_device *pdev, const struct realte=
k_intc_desc *desc)
> +{
> +	struct realtek_intc_data *data;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	unsigned int total_subset_num =3D 0;
> +	int ret, parent_irq =3D 0;
> +
> +	for (unsigned int i =3D 0; i < desc->bank_num; i++)
> +		total_subset_num +=3D desc->banks[i].subset_num;
> +
> +	data =3D devm_kzalloc(dev, struct_size(data, subset_data, total_subset_=
num),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->saved_en =3D devm_kcalloc(dev, desc->bank_num, sizeof(*data->save=
d_en), GFP_KERNEL);
> +	if (!data->saved_en)
> +		return -ENOMEM;
> +
> +	data->base =3D syscon_node_to_regmap(node->parent);

[Severity: High]
Does using syscon_node_to_regmap() here cause an invalid wait context in
hardirq and irq_chip callbacks?

In drivers/mfd/syscon.c, of_syscon_register() initializes the regmap using
syscon_regmap_config, which leaves .use_raw_spinlock as false (and may also
attach a clock whose clk_enable()/clk_disable() path takes a non-raw
spinlock_t). __regmap_init() therefore configures data->base with
regmap_lock_spinlock(), which acquires a sleeping spinlock_t
(LD_WAIT_CONFIG) rather than a raw_spinlock_t.

data->base is then accessed from:
- realtek_intc_mask_irq() -> regmap_assign_bits() and
  realtek_intc_unmask_irq() -> regmap_set_bits() while the genirq core holds
  desc->lock (a raw_spinlock_t, LD_WAIT_SPIN)
- realtek_intc_handler() and realtek_intc_shared_handler() (registered with
  IRQF_SHARED | IRQF_NO_THREAD) -> realtek_intc_dispatch() -> regmap_read()=
 /
  regmap_write() in primary hardirq context

Won't this trigger lockdep "[ BUG: Invalid wait context ]" warnings with
CONFIG_PROVE_RAW_LOCK_NESTING=3Dy and sleep in atomic context on PREEMPT_RT
kernels?

> +	if (IS_ERR(data->base))
> +		return PTR_ERR(data->base);
> +
> +	data->desc =3D desc;
> +
> +	data->domain =3D irq_domain_create_linear(of_fwnode_handle(node),
> +						32 * desc->bank_num,
> +						&realtek_intc_domain_ops, data);
> +	if (!data->domain)
> +		return -ENOMEM;
> +
> +	for (unsigned int i =3D 0; i < desc->bank_num; i++) {
> +		const struct realtek_intc_info *info =3D &desc->banks[i];
> +
> +		for (unsigned int j =3D 0; j < info->subset_num; j++) {
> +			ret =3D realtek_intc_subset(pdev, data, i, j, parent_irq);

[Severity: High]
Should realtek_intc_probe() and realtek_intc_remove() mask controlled
interrupts in hardware before registering or after tearing down the parent
IRQ handlers?

In the genirq core (desc_set_defaults()), newly allocated irq_desc instances
start with IRQD_IRQ_DISABLED and IRQD_IRQ_MASKED set in software, assuming
all hardware interrupts start masked at the controller. Unlike
realtek_intc_suspend(), neither realtek_intc_probe() nor
realtek_intc_remove() disables interrupts in info->scpu_int_en_offset.

If the bootloader, kexec, or a previous driver bind leaves any interrupt bit
enabled in scpu_int_en_offset and it asserts once realtek_intc_subset()
registers the parent handler:
- If the hwirq is not yet mapped in data->domain,
  generic_handle_domain_irq() returns -EINVAL without masking
  scpu_int_en_offset, causing an unmasked level interrupt to storm (and
  returning IRQ_NONE on shared parent IRQs until the GIC disables the parent
  line).
- If the hwirq is mapped but not yet requested, handle_level_irq() calls
  mask_ack_irq() -> mask_irq(), which sees IRQD_IRQ_MASKED already set in
  software and skips calling realtek_intc_mask_irq(), leaving the hardware
  interrupt enabled in scpu_int_en_offset.

> +			if (ret < 0) {
> +				dev_err(dev, "failed to init bank %u subset %u: %d\n",
> +					i, j, ret);
> +				goto irq_domain_cleanup;
> +			}
> +
> +			parent_irq++;
> +		}
> +	}
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	return 0;
> +
> +irq_domain_cleanup:
> +	realtek_intc_teardown_irqs(data, dev, parent_irq);
> +	irq_domain_remove(data->domain);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(realtek_intc_probe);
> +
> +void realtek_intc_remove(struct platform_device *pdev)
> +{
> +	struct realtek_intc_data *data =3D platform_get_drvdata(pdev);
> +	const struct realtek_intc_desc *desc =3D data->desc;
> +	struct device *dev =3D &pdev->dev;
> +	unsigned int count =3D 0;
> +
> +	for (unsigned int i =3D 0; i < desc->bank_num; i++)
> +		count +=3D desc->banks[i].subset_num;
> +
> +	realtek_intc_teardown_irqs(data, dev, count);
> +	irq_domain_remove(data->domain);
> +}

[Severity: High]
Does calling irq_domain_remove(data->domain) in realtek_intc_remove() (and
the irq_domain_cleanup path of realtek_intc_probe()) without first disposing
of mapped virqs leak irq_desc mappings and leave dangling pointers?

When interrupts are mapped in data->domain, realtek_intc_domain_map() sets
desc->irq_data.chip to &realtek_intc_chip and desc->irq_data.chip_data to
data, while desc->irq_data.domain points to data->domain.

Removing data->domain without iterating over the domain hwirqs and calling
irq_dispose_mapping(irq_find_mapping(data->domain, hwirq)) triggers:

    WARN_ON(!radix_tree_empty(&domain->revmap_tree));

in irq_domain_remove(), and leaves any mapped virq descriptors active in
sparse_irqs with dangling pointers to the freed data->domain, devm-freed
struct realtek_intc_data, and realtek_intc_chip.

> diff --git a/drivers/irqchip/irq-realtek-intc-common.h b/drivers/irqchip/=
irq-realtek-intc-common.h
> new file mode 100644
> index 0000000000000..8ea34416d0365
> --- /dev/null
> +++ b/drivers/irqchip/irq-realtek-intc-common.h
> @@ -0,0 +1,93 @@

[ ... ]

> +#define IRQ_ALWAYS_ENABLED	U32_MAX
> +#define DISABLE_INTC		0
> +#define CLEAN_INTC_STATUS	GENMASK(31, 1)
> +
> +int realtek_intc_probe(struct platform_device *pdev, const struct realte=
k_intc_desc *desc);
> +void realtek_intc_remove(struct platform_device *pdev);
> +int realtek_intc_suspend(struct device *dev);
> +int realtek_intc_resume(struct device *dev);
> +
> +#endif /* _IRQ_REALTEK_INTC_COMMON_H */

[Severity: Low]
drivers/irqchip/irq-realtek-intc-common.h only includes <linux/bits.h>,
<linux/limits.h>, and <linux/types.h>, without forward declarations or
headers for struct platform_device, struct device, struct regmap, or struct
irq_domain.

If a translation unit includes this header without first including
<linux/platform_device.h> or <linux/device.h>, will struct platform_device
and struct device be scoped only to these function prototypes and trigger
-Wvisibility warnings?

Adding forward declarations (or the corresponding headers) would make the
header self-contained.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018160653.3940=
371-1-eleanor.lin@realtek.com?part=3D4
