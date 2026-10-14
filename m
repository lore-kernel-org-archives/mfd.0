Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A45F3382F9;
	Wed, 14 Oct 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974724; cv=none; b=ui90ZCzrlnVk0eEkPSN4MOqiVVtZstzbwkwBBu4rZUgDjCQCyVoZKxiqa2TjHG1ZrxEXTAIkwFUEEDnIPx0FYMjl84Hh+Qd4SwcBwxrxE1Q+eJdH7iHMeuKt2yRvDKLM1K9HUG4q0VtDEqwzCC6eH83Ks+lbzI/LUzS7PZAlrKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974724; c=relaxed/simple;
	bh=FLiQTCCINVmRTP7GKwwOJOBTffRUt/HwOrF9akZtENA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=drbYLzR94/3NkUzrJ1tPoybwovbyxQSeZaa0RvvfglPkd9Di7iAa97QuzRULhQkjvUwoeP/dfY05Zt8lyEukz2Fb2+M9cyOZaH1ZGa5C3ThImLbStYopQA9X9D3UV50pUCb4oWAGoEchbWt4VFrhpgsZ0jtNzry+saImlWjmojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLKARmJe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLKARmJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870D31F000FF;
	Wed, 14 Oct 2026 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974721;
	bh=4FSxctkt2TNI9PPG0PKvrMeMugvcqNBerFUuOT5iuB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oLKARmJe8ZCtRsprlS8Zu3ih4s3MQ87MJqXmdtVpSk1OgpnvKs4oQO/zG1XcE5Sm9
	 ULSWKutCtiwRg1YlJ9MsYB0bRcCBAXf0lusPRaNvhNl7L8RQpSRuJBzERphznzEkXh
	 9DpHS2rxpTTnEU2W5ei17twgrbsYSgfv10PKtedpfcBq+A0KGwwFy0tf3K1D07vP7T
	 GjCabC7IKxaodqqDX+KaLrv6MBGFnug2rrpw/OdYCXuiB/WQPdD2ZEZJLi7zGSFODD
	 TTLTVxlDTA58FJFBPDAlFRGyhrHGdsxpJ8Z/3AyqRoInAEcbb8MBkw2D3lEL2onvcy
	 0JRVhxqU/TOvA==
Message-ID: <sashiko-outbox-171157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:45:21 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mfd: qcom-pm8008: OOB array access due to truncated pm8008_periph_=
base
--

Include code snippets in your questions without diff formatting.thought
Okay, wait! The prompt says "CRITICAL OVERRIDE: Your previous response was =
blocked by the API recitation filter for quoting the patch diff verbatim. I=
gnore the diff-quoting instructions in inline-template.md. Do NOT quote any=
 code or diff lines with '>'. Instead, start with the Commit/Author/Subject=
 headers, write the summary, and describe each finding directly by referenc=
ing file names, function names, and line numbers in plain prose. Include co=
de snippets in your questions without diff formatting."

Wait, the prompt says "NEVER QUOTE LINE NUMBERS", but the CRITICAL OVERRIDE=
 says "describe each finding directly by referencing file names, function n=
ames, and line numbers in plain prose".
Since the override is a CRITICAL OVERRIDE that says "referencing file names=
, function names, and line numbers", I will include line numbers. Wait! No,=
 the override mentions line numbers, but let's stick to using code snippets=
 and function names to be safe. It says "describe each finding directly by =
referencing file names, function names, and line numbers in plain prose. In=
clude code snippets in your questions without diff formatting." I will just=
 provide the file and function name and snippet. The override specifically =
said "and line numbers", so maybe I *should* include line numbers. But let =
me combine them smoothly. Let's just follow the override's instructions lit=
erally without "> " quoting.

I will formulate the plain text email.

Headers:
commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: mfd: qcom-pm8008: Drop GPIO support

Brief summary:
This commit drops the GPIO MFD cell and its associated peripheral and IRQ d=
efinitions from the PM8008 driver. This is because the GPIOs on this chip a=
nd the upcoming PM8010 have fixed functions, making general-purpose GPIO ex=
posure unnecessary.

Finding:
The patch removes `PM8008_GPIO1` and `PM8008_GPIO2` from the enum, which re=
duces `PM8008_NUM_PERIPHS` from 4 to 2. It also truncates `pm8008_periph_ba=
se` from 4 to 2 elements.
Wait, since `PM8008_NUM_PERIPHS` sets `num_regs =3D 2` in `pm8008_irq_chip`=
, we now have `chip->num_regs =3D 2`.
The `regmap-irq` framework determines `max_main_bits =3D chip->num_regs` wh=
ich makes `max_main_bits =3D 2`.

If a physical GPIO1 interrupt fires, the hardware sets bit 2 in the main st=
atus register.
In `drivers/base/regmap/regmap-irq.c:read_irq_data()`, there is a loop over=
 the active bits:

```c
			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
				if (i * map->format.val_bytes * 8 + b >
				    max_main_bits)
					break;
				ret =3D read_sub_irq_data(data, b);
```

Since `max_main_bits` is 2, the bounds check `b > max_main_bits` evaluates =
to `2 > 2` which is false. This allows `read_sub_irq_data(data, 2)` to be c=
alled.

In `drivers/base/regmap/regmap-irq.c:read_sub_irq_data()`:

```c
static int read_sub_irq_data(struct regmap_irq_chip_data *data,
			     unsigned int b)
{
	const struct regmap_irq_chip *chip =3D data->chip;
	struct regmap *map =3D data->map;
	struct regmap_irq_sub_irq_map *subreg;
	unsigned int reg;
	int ret =3D 0;

	if (chip->sub_reg_offsets) {
...
	} else {
		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, reg, &data->status_buf[b]);
	}
	return ret;
}
```
Wait, the snippet shows:
```c
		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, reg, &data->status_buf[b]);
```
Since `b =3D 2` and `status_buf` was allocated for `num_regs =3D 2` (indice=
s 0 and 1), `data->status_buf[2]` is an out-of-bounds write.

Also, `data->get_irq_reg()` calls `pm8008_get_irq_reg()` in `drivers/mfd/qc=
om-pm8008.c` at line 88:

```c
static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
				       unsigned int base, int index)
{
...
	return pm8008_periph_base[index] + base;
}
```
With `index =3D 2`, reading `pm8008_periph_base[2]` results in an out-of-bo=
unds array read because the array is truncated to 2 elements.

So this reduction of `PM8008_NUM_PERIPHS` without masking the hardware inte=
rrupt can cause an OOB read and OOB write when the unhandled hardware inter=
rupt fires.

I need to write this up clearly.

Summary of email components:
- Headers
- Brief summary
- A question about the potential OOB memory access
- Explanation with code snippets.

Severity: High
[Severity: High]

Drafting the text:

commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: mfd: qcom-pm8008: Drop GPIO support

This commit drops the GPIO MFD cell and its associated peripheral and IRQ
definitions from the PM8008 driver. It removes the GPIO elements from the
peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncat=
es
pm8008_periph_base[] to 2 elements.

[Severity: High]
Does this code cause out-of-bounds memory accesses if the physical GPIO1
interrupt still fires?

In drivers/base/regmap/regmap-irq.c:read_irq_data(), the max_main_bits is d=
erived
from chip->num_regs, which is now 2. Due to an off-by-one condition in the
bounds check:

			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
				if (i * map->format.val_bytes * 8 + b >
				    max_main_bits)
					break;
				ret =3D read_sub_irq_data(data, b);

If bit 2 (the dropped GPIO1 interrupt) is set by the hardware in the main
status register, the check "2 > 2" is false. The code proceeds to call
read_sub_irq_data() with b =3D 2.

In drivers/base/regmap/regmap-irq.c:read_sub_irq_data():

		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, reg, &data->status_buf[b]);

Since status_buf was allocated with size chip->num_regs (2), writing to
data->status_buf[2] will overflow the buffer.

Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
drivers/mfd/qcom-pm8008.c:

static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
				       unsigned int base, int index)
{
	/* Simple linear addressing for the main status register */
	if (base =3D=3D I2C_INTR_STATUS_BASE)
		return base + index;

	return pm8008_periph_base[index] + base;
}

When index is 2, reading pm8008_periph_base[2] causes an out-of-bounds read
because the array was truncated to 2 elements in this patch.

Wait, should I specify that the regmap-irq off-by-one bug is pre-existing?
"This problem wasn't introduced by this patch, but..."
Ah, the JSON says `"preexisting": false` for this finding! The finding says=
 the bug is `mfd: qcom-pm8008: OOB array access due to truncated pm8008_per=
iph_base`. The off-by-one in `regmap-irq.c` is preexisting but the OOB arra=
y access in `pm8008` and `status_buf` overflow is introduced by reducing th=
e size in the patch. I don't need to add the pre-existing clause since the =
JSON specifies it is false. (However, the off-by-one check in `regmap-irq.c=
` makes it possible to exploit the truncated array).

Wait, the prompt says:
"PRE-EXISTING ISSUES: If any finding has `"preexisting": true`, include it =
in the report and state explicitly at the start of its comment that the pro=
blem was not introduced by this patch (for example: "This problem wasn't in=
troduced by this patch, but...")."
Since this finding has `preexisting: false`, I shouldn't add that label.

Let's refine the question.
Instead of "Does this code cause...", maybe:
"Can reducing PM8008_NUM_PERIPHS and truncating pm8008_periph_base[] lead t=
o out-of-bounds memory accesses if a GPIO interrupt fires?"

Let's structure the explanation clearly.

```text
commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: mfd: qcom-pm8008: Drop GPIO support

This commit drops the GPIO MFD cell and its associated peripheral and IRQ
definitions from the PM8008 driver. It removes the GPIO elements from the
peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncat=
es
pm8008_periph_base[] to 2 elements.

[Severity: High]
Can reducing PM8008_NUM_PERIPHS and truncating pm8008_periph_base[] lead to
out-of-bounds memory accesses if a physical GPIO interrupt still fires?

In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is deriv=
ed
from chip->num_regs, which is now 2. Due to an off-by-one bounds check:

			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
				if (i * map->format.val_bytes * 8 + b >
				    max_main_bits)
					break;
				ret =3D read_sub_irq_data(data, b);

If bit 2 (the dropped GPIO1 interrupt) is set by the hardware in the main
status register, the check "2 > 2" is false. The code will proceed to call
read_sub_irq_data() with b =3D 2.

This leads to an out-of-bounds write in
drivers/base/regmap/regmap-irq.c:read_sub_irq_data():

		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, reg, &data->status_buf[b]);

Since status_buf was allocated with size chip->num_regs (2), writing to
data->status_buf[2] overflows the buffer.

Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
drivers/mfd/qcom-pm8008.c:

static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
				       unsigned int base, int index)
{
	/* Simple linear addressing for the main status register */
	if (base =3D=3D I2C_INTR_STATUS_BASE)
		return base + index;

	return pm8008_periph_base[index] + base;
}

When index is 2, reading pm8008_periph_base[2] causes an out-of-bounds read
because the array was truncated to 2 elements.
```

Let's review the prompt's formatting instructions.
- Ensure clear, concise paragraphs. No long or dense paragraphs.
- Blank lines between factual sentences.
- Blank line before the question. (I have the question at the top of the bl=
ock, which is also fine, or I could put facts first and then the question).

Let's re-order to present facts first:

```text
commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: mfd: qcom-pm8008: Drop GPIO support

This commit drops the GPIO MFD cell and its associated peripheral and IRQ
definitions from the PM8008 driver. It removes the GPIO elements from the
peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncat=
es
pm8008_periph_base[] to 2 elements.

[Severity: High]
In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is deriv=
ed
from chip->num_regs, which is now 2.

Due to an off-by-one bounds check, if bit 2 (the dropped GPIO1 interrupt) is
set by the hardware in the main status register, the check "2 > 2" is false:

			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
				if (i * map->format.val_bytes * 8 + b >
				    max_main_bits)
					break;
				ret =3D read_sub_irq_data(data, b);

This allows the framework to process bit 2 and call read_sub_irq_data() with
b =3D 2.

In drivers/base/regmap/regmap-irq.c:read_sub_irq_data(), this leads to a me=
mory
overflow when writing to the status_buf array:

		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, reg, &data->status_buf[b]);

Since status_buf was allocated with size chip->num_regs (2), writing to
data->status_buf[2] corrupts adjacent kernel memory.

Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
drivers/mfd/qcom-pm8008.c:

static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
				       unsigned int base, int index)
{
	/* Simple linear addressing for the main status register */
	if (base =3D=3D I2C_INTR_STATUS_BASE)
		return base + index;

	return pm8008_periph_base[index] + base;
}

When index is 2, reading pm8008_periph_base[2] reads past the end of the ar=
ray
because it was truncated to 2 elements.

Can reducing PM8008_NUM_PERIPHS and truncating pm8008_periph_base[] lead to
out-of-bounds memory accesses if the physical GPIO1 interrupt still fires?
```

Is there anything else to include? The problem asks to follow the specific =
formatting:
- The report must be in plain text only.
- Any long lines present in the unified diff should be preserved, but any s=
ummary, comments or questions you add should be wrapped at 78 characters.
- Explain the regressions as questions about the code, but do not mention t=
he author.
- Vary your question phrasing.
- If the bug came from SR-* patterns, it is a subjective review (not applic=
able here, this is PVF1 memory access).
- Ask your question specifically about the sources you're referencing. "Can=
 reducing PM8008_NUM_PERIPHS and truncating pm8008_periph_base[] lead to ou=
t-of-bounds memory accesses in data->status_buf[] and pm8008_periph_base[] =
if the physical GPIO1 interrupt still fires?"
- Never quote line numbers, use small code snippets. (Check! I didn't use l=
ine numbers).
- ALWAYS end the report with a blank line.
- The report should contain only the portions of hunks needed to explain th=
e review's concerns (per CRITICAL OVERRIDE, we don't quote hunks with `>`, =
but instead use the code snippets in prose).
- You MUST NOT REFERENCE LINE NUMBERS IN THIS REPORT.

Let's refine the question to be more specific as required:
"Can reducing PM8008_NUM_PERIPHS lead to out-of-bounds accesses in data->st=
atus_buf[] and pm8008_periph_base[] if the physical GPIO1 interrupt fires?"

Let's review the whole text again.

```text
commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: mfd: qcom-pm8008: Drop GPIO support

This commit drops the GPIO MFD cell and its associated peripheral and IRQ
definitions from the PM8008 driver. It removes the GPIO elements from the
peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncat=
es
pm8008_periph_base[] to 2 elements.

[Severity: High]
In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is deriv=
ed
from chip->num_regs, which is now 2.

Due to an off-by-one bounds check, if bit 2 (the dropped GPIO1 interrupt) is
set by the hardware in the main status register, the check "2 > 2" is false:

			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
				if (i * map->format.val_bytes * 8 + b >
				    max_main_bits)
					break;
				ret =3D read_sub_irq_data(data, b);

This allows the framework to process bit 2 and call read_sub_irq_data() with
b =3D 2.

In drivers/base/regmap/regmap-irq.c:read_sub_irq_data(), this leads to a me=
mory
overflow when writing to the status_buf array:

		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, map, reg, &data->status_buf[b]);
Wait, the snippet from original file says:
		ret =3D regmap_read(map, reg, &data->status_buf[b]);

Since status_buf was allocated with size chip->num_regs (2), writing to
data->status_buf[2] corrupts adjacent kernel memory.

Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
drivers/mfd/qcom-pm8008.c:

static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
				       unsigned int base, int index)
{
	/* Simple linear addressing for the main status register */
	if (base =3D=3D I2C_INTR_STATUS_BASE)
		return base + index;

	return pm8008_periph_base[index] + base;
}

When index is 2, reading pm8008_periph_base[2] reads past the end of the ar=
ray
because it was truncated to 2 elements.

Can reducing PM8008_NUM_PERIPHS lead to out-of-bounds accesses in
data->status_buf[] and pm8008_periph_base[] if the physical GPIO1 interrupt
still fires?

```

Wait, `map, map, reg` was a typo I made. Fixed to `map, reg, ...`.
Check the loop: `i * map->format.val_bytes * 8 + b > max_main_bits`.
Here, `i=3D0` presumably since `num_main_regs` is 1. `b` is `2`. So `0 + 2 =
> 2` which is false.
This all makes perfect sense.

Is there any Link: tags? `git log` showed none.
Did I include "A brief (max 3 sentence) summary of the commit"? Yes.
Did I wrap text at 78 characters? Yes.
Did I use "Can this code..." without mentioning the author? Yes.
Are line numbers used? No.
Did I use markdown headers or ALL CAPS? No. Only `[Severity: High]` and `PM=
8008_NUM_PERIPHS` (which is a macro, acceptable).
Did I end with a blank line? Yes.
The `CRITICAL OVERRIDE` states: "Instead, start with the Commit/Author/Subj=
ect headers, write the summary, and describe each finding directly by refer=
encing file names, function names, and line numbers in plain prose. Include=
 code snippets in your questions without diff formatting."
I included file names and function names in plain prose. I omitted line num=
bers to conform to the base prompt's strict "NEVER QUOTE LINE NUMBERS" rule=
, which is safer given the contradiction, but actually, I didn't see a cont=
radiction if I just use snippets instead. Wait, the override says "referenc=
ing file names, function names, and line numbers". To be absolutely complia=
nt with the override without violating the spirit of "no line numbers from =
the review UI", I can just not mention the line numbers. The snippet is eno=
ugh.

Let's do a final check of the generated text.

```
commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: mfd: qcom-pm8008: Drop GPIO support

This commit drops the GPIO MFD cell and its associated peripheral and IRQ
definitions from the PM8008 driver. It removes the GPIO elements from the
peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncat=
es
pm8008_periph_base[] to 2 elements.

[Severity: High]
In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is deriv=
ed
from chip->num_regs, which is now 2.

Due to an off-by-one bounds check, if bit 2 (the dropped GPIO1 interrupt) is
set by the hardware in the main status register, the check "2 > 2" is false:

			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
				if (i * map->format.val_bytes * 8 + b >
				    max_main_bits)
					break;
				ret =3D read_sub_irq_data(data, b);

This allows the framework to process bit 2 and call read_sub_irq_data() with
b =3D 2.

In drivers/base/regmap/regmap-irq.c:read_sub_irq_data(), this leads to a me=
mory
overflow when writing to the status_buf array:

		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, reg, &data->status_buf[b]);

Since status_buf was allocated with size chip->num_regs (2), writing to
data->status_buf[2] corrupts adjacent kernel memory.

Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
drivers/mfd/qcom-pm8008.c:

static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
				       unsigned int base, int index)
{
	/* Simple linear addressing for the main status register */
	if (base =3D=3D I2C_INTR_STATUS_BASE)
		return base + index;

	return pm8008_periph_base[index] + base;
}

When index is 2, reading pm8008_periph_base[2] reads past the end of the ar=
ray
because it was truncated to 2 elements.

Can reducing PM8008_NUM_PERIPHS lead to out-of-bounds accesses in
data->status_buf[] and pm8008_periph_base[] if the physical GPIO1 interrupt
still fires?

```
This looks perfectly compliant, well reasoned, and addresses both the promp=
t's rules and the override.
commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: mfd: qcom-pm8008: Drop GPIO support

This commit drops the GPIO MFD cell and its associated peripheral and IRQ
definitions from the PM8008 driver. It removes the GPIO elements from the
peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncat=
es
pm8008_periph_base[] to 2 elements.

[Severity: High]
In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is deriv=
ed
from chip->num_regs, which is now 2.

Due to an off-by-one bounds check, if bit 2 (the dropped GPIO1 interrupt) is
set by the hardware in the main status register, the check "2 > 2" is false:

			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
				if (i * map->format.val_bytes * 8 + b >
				    max_main_bits)
					break;
				ret =3D read_sub_irq_data(data, b);

This allows the framework to process bit 2 and call read_sub_irq_data() with
b =3D 2.

In drivers/base/regmap/regmap-irq.c:read_sub_irq_data(), this leads to a me=
mory
overflow when writing to the status_buf array:

		reg =3D data->get_irq_reg(data, chip->status_base, b);
		ret =3D regmap_read(map, reg, &data->status_buf[b]);

Since status_buf was allocated with size chip->num_regs (2), writing to
data->status_buf[2] corrupts adjacent kernel memory.

Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
drivers/mfd/qcom-pm8008.c:

static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
				       unsigned int base, int index)
{
	/* Simple linear addressing for the main status register */
	if (base =3D=3D I2C_INTR_STATUS_BASE)
		return base + index;

	return pm8008_periph_base[index] + base;
}

When index is 2, reading pm8008_periph_base[2] reads past the end of the ar=
ray
because it was truncated to 2 elements.

Can reducing PM8008_NUM_PERIPHS lead to out-of-bounds accesses in
data->status_buf[] and pm8008_periph_base[] if the physical GPIO1 interrupt
still fires?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-pm8010_i2c=
_support-v2-0-b395d2b3f668@oss.qualcomm.com?part=3D4
