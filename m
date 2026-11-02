Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613728;
	b=ELPrLbc5B5DDGWR/ehZLI13Rprx4sfV8pWH+auGOPoXX2omTZYKBzswC++jh73pHCK4u
	 MyasheUs2vyTAc7ZRm/rFBC3saPb343XEqlerf2EwzFYXD1RBDdz0eUvv8uqutTY7ps5D
	 GJNgQVjR0AaYrK6gQwc1CA/U/lzYsCkMxb2GKMtFAF0JUBZaE7jEf8yG70Zip/ol4XJRG
	 JSwvn4zxs18x5h3lD31oE6xjYTgbqfRWZ8OLgkP3EWAB+Cm/EfHEkno/Yyrkiwhp8fpHY
	 HejAQH/TFiR0uHcCwIJxcM21NiOhoXPHQFui9cDacYVWCMExwz/b+LiqvUv/OkKVIGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613728;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BqDm/3zC3tWJLoG5EdnbQryR/I3N2frivTlPHItZLyg=;
	b=fiJQJc+PJChpmU2BOf71ohGxw800pDezt2p8swJ3WQan07PvJNoOEw0P173lgEoGQ9EO
	 7OXc2wZiX1AhMUm1Ww2fw4KAzJW+2I3qVna+7XH8SeJRIAi1AwOsKyufq5AZN0jUlg2J/
	 wPRA17gnaXwx0rh3Sk25TTdrxJ1/Jm39koqePWtdptQ8orjQcLLW9bEbs9UZ7jRO5xmyy
	 1tWBZ7SzEOyeO8M8Ed25PD4PJMU/Q+4kp+2UC0SfTRfQp21k0GfxUJUwKx65UslKsOCGL
	 luw4/6x82s+vqIX4vr0U05j9Jj9Qxs77nZe//2TbQ2V/u5MciwG/TYG7kOIP0PfQZCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SgTvop9b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47D606A337
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SgTvop9b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141201F00A15;
	Mon,  2 Nov 2026 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793613727;
	bh=BqDm/3zC3tWJLoG5EdnbQryR/I3N2frivTlPHItZLyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SgTvop9bILCGWKTJsLDqjMaBAAI/zxn5lzzTKcfR/4KEOMd7S8B696chF9XOYodLl
	 F/TfY7ze53pG5Q4nclA7G5rOIgmN3pvTfLkC6qls9rWNff14oz/OFLj1IKk/g+ygH9
	 oy6q9IITOyfOSzd6UWSDRdxlWeFUjcAr650ZvAi47QF4CrVfSXLRPeVfibE3we65FD
	 jIsiM51s+XefO+lKpCxwZ17XQ3VXy+RX9zdE+rxfp7OOYP0c82H6zgLMo4NkPVSebD
	 SB9AvjDQ6e4k3DqZjqbjInFaBik9sxhU/l9yR0HexUwC36fN8Qf9oteYhFX/PePlsG
	 GnKpvhmgWMZXQ==
Message-ID: <sashiko-outbox-193229@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] MIPS: SGI-IP30: shut down cleanly on a power
 button press
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imre Kaloz" <kaloz@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261102094106.21300-3-kaloz@kernel.org>
References: <20261102094106.21300-1-kaloz@kernel.org>
 <20261102094106.21300-3-kaloz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:02:06 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] MIPS: SGI-IP30: atomic sleep and deadlock in ip30_machine_power_of=
f()
- [High] MIPS: SGI-IP30: broken modular RTC power-off in ip30_prepare_power=
off()
- [High] MIPS: SGI-IP30: unserialized indirect RTC register access in power=
off
--

commit dd15dcc6768c98c5a5f42977da8413212870ba81
Author: Imre Kaloz <kaloz@kernel.org>

MIPS: SGI-IP30: shut down cleanly on a power button press

This patch supplies a plat_prepare_poweroff hook for SGI IP30 that initiates
an orderly shutdown via userspace on the first power button press and forces
an immediate power-off on a second press or after a 120-second timeout. It
also serializes concurrent callers of ip30_machine_power_off() and enters an
nbcon emergency section before invoking ds1685_rtc_poweroff().

> diff --git a/arch/mips/sgi-ip30/ip30-power.c b/arch/mips/sgi-ip30/ip30-po=
wer.c
> index b1b33c9cfd761..cff8f48754292 100644
> --- a/arch/mips/sgi-ip30/ip30-power.c
> +++ b/arch/mips/sgi-ip30/ip30-power.c
[ ... ]
> @@ -32,6 +35,8 @@ static void __noreturn ip30_machine_restart(char *cmd)
>  	unreachable();
>  }
> =20
> +static atomic_t ip30_power_off_claimed =3D ATOMIC_INIT(0);
> +
>  static void ip30_machine_power_off(void)
>  {
>  	struct device *dev;
> @@ -48,14 +53,69 @@ static void ip30_machine_power_off(void)
>  		return;
>  	}
> =20
> +	/*
> +	 * The RTC registers are reached through an index/data pair, so one
> +	 * CPU at a time may drive them, and a second button press, the
> +	 * timeout and pm_power_off can arrive together.  Interrupts go off
> +	 * first so the claimant cannot be preempted by a waiter on its CPU;
> +	 * the waiters spin until the power drops.
> +	 */
> +	local_irq_disable();
> +	if (atomic_xchg(&ip30_power_off_claimed, 1))
> +		for (;;)
> +			cpu_relax();

[Severity: High]
As reported by Sashiko on v1 [1], can another CPU still race on the
indirect RTC index/data registers and bank selection while
ds1685_rtc_poweroff() is running?

On SGI IP30, the DS1687 is accessed in indirect register mode
(ds1685_reg_indirect), where every ds1685_indirect_read() and
ds1685_indirect_write() performs two separate MMIO accesses to rtc->regs and
rtc->data, and RTC_EXT_CTRL_4A (0x4a) is only accessible while Bank 1 is
selected.

Claiming ip30_power_off_claimed only serializes callers of
ip30_machine_power_off() against each other; it does not stop other CPUs or
acquire rtc_lock(rtc->dev), and ds1685_rtc_poweroff() only calls
disable_irq_nosync(rtc->irq_num):

  1. If a second power button interrupt starts ds1685_rtc_extended_irq() on
     another CPU before HEART interrupts are masked, that handler sleeps in
     msleep(500) and wakes via the per-CPU CP0 timer interrupt (which is not
     routed through HEART). It then accesses RTC_EXT_CTRL_4B via rtc->regs
     and rtc->data before calling rtc->prepare_poweroff():

     drivers/rtc/rtc-ds1685.c:ds1685_rtc_extended_irq() {
         ...
         msleep(500);
         rtc->write(rtc, RTC_EXT_CTRL_4B,
                    (rtc->read(rtc, RTC_EXT_CTRL_4B) |
                     RTC_CTRL_4B_KSE));

         if (rtc->prepare_poweroff !=3D NULL)
             rtc->prepare_poweroff();
         ...
         ds1685_rtc_switch_to_bank0(rtc);
     }

  2. After ip30_prepare_poweroff() returns on the first press,
     ds1685_rtc_extended_irq() calls ds1685_rtc_switch_to_bank0(rtc), which
     can race with a concurrent pm_power_off() call.

  3. During ip30_power_timeout() or userspace shutdown (such as hwclock on
     another CPU), normal RTC ops, NVRAM accesses, or sysfs/procfs reads
     acquire rtc_lock(rtc->dev), drive rtc->regs and rtc->data, and switch
     the chip back to Bank 0.

If another CPU changes the index register or switches the RTC back to Bank 0
before ds1685_rtc_poweroff() writes RTC_CTRL_4A_PAB to RTC_EXT_CTRL_4A,
wouldn't that write corrupt battery-backed Bank 0 NVRAM at offset 0x4a and
leave the system spinning forever without cutting power?

> +
>  	/* Devices losing power may still interrupt; keep their handlers out. */
>  	for (cpu =3D 0; cpu < HEART_MAX_CPUS; cpu++)
>  		heart_write(HEART_CLR_ALL_MASK, &heart_regs->imr[cpu]);
>  	heart_write(HEART_ACK_ALL_MASK, &heart_regs->clear_isr);
> =20
> +	/*
> +	 * Nothing schedules before the power drops, so the RTC's message must
> +	 * be printed from this context, not left to the console thread.  The
> +	 * emergency section is never left.
> +	 */
> +	nbcon_cpu_emergency_enter();
>  	ds1685_rtc_poweroff(to_platform_device(dev));
>  }

[Severity: High]
Doesn't ds1685_rtc_poweroff() sleep in msleep(20) before cutting power,
violating the atomic context established by local_irq_disable() and
nbcon_cpu_emergency_enter()?

In drivers/rtc/rtc-ds1685.c, ds1685_rtc_poweroff() calls msleep(20) right
before setting RTC_CTRL_4A_PAB:

drivers/rtc/rtc-ds1685.c:ds1685_rtc_poweroff() {
    ...
    /* Set PAB to 1 in Control 4A to power the system down. */
    dev_warn(&pdev->dev, "Powerdown.\n");
    msleep(20);
    rtc->write(rtc, RTC_EXT_CTRL_4A,
               (ctrl4a | RTC_CTRL_4A_PAB));
}

Because ip30_machine_power_off() disables local interrupts and calls
nbcon_cpu_emergency_enter() (which disables preemption and increments the
per-CPU emergency nesting count), calling msleep(20) -> schedule() triggers=
 a
scheduling-while-atomic bug, context-switches with the per-CPU nbcon
emergency nesting count elevated, and re-enables local interrupts when the
scheduler unlocks the runqueue.

Furthermore, while the claimant task is sleeping in msleep(20), if a
concurrent caller of ip30_machine_power_off() (such as ip30_power_timeout(),
poweroff_work from orderly_poweroff(), or the RTC IRQ thread on a second
button press) gets scheduled onto the same CPU, it will call
local_irq_disable(), see ip30_power_off_claimed =3D=3D 1, and spin forever =
in
cpu_relax() with interrupts disabled. Wouldn't that prevent the 20ms timer
wakeup from ever completing and permanently deadlock the machine before
RTC_CTRL_4A_PAB is written?

> =20
> +#define IP30_POWERDOWN_TIMEOUT	120	/* seconds */
> +
> +static bool ip30_shutting_down;
> +
> +static void ip30_power_timeout(struct work_struct *work)
> +{
> +	struct device *dev;
> +
> +	dev =3D bus_find_device_by_name(&platform_bus_type, NULL, "rtc-ds1685");
> +	if (!dev)
> +		return;
> +
> +	/*
> +	 * Unbinding rtc-ds1685 frees the RTC under the device lock, so hold
> +	 * it across the drvdata check and the power-off.
> +	 */
> +	device_lock(dev);
> +	ip30_machine_power_off();
> +	device_unlock(dev);
> +	put_device(dev);
> +}
> +
> +static DECLARE_DELAYED_WORK(ip30_power_work, ip30_power_timeout);
> +
> +/* Called by the RTC driver when the power button is pressed. */
> +void ip30_prepare_poweroff(void)
> +{
> +	/* A second press powers off at once. */
> +	if (ip30_shutting_down)
> +		ip30_machine_power_off();
> +
> +	/* Shut down through userspace, powering off anyway if it stalls. */
> +	ip30_shutting_down =3D true;
> +	orderly_poweroff(true);
> +	schedule_delayed_work(&ip30_power_work, IP30_POWERDOWN_TIMEOUT * HZ);
> +}
> +
>  static int __init ip30_reboot_setup(void)
>  {
>  	_machine_restart =3D ip30_machine_restart;
> diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
> index 5f8ac364b610e..8f603651cc8e5 100644
> --- a/drivers/mfd/ioc3.c
> +++ b/drivers/mfd/ioc3.c
[ ... ]
> @@ -321,6 +324,9 @@ static struct ds1685_rtc_platform_data ip30_rtc_platf=
orm_data =3D {
>  	.no_irq =3D false,
>  	.uie_unsupported =3D true,
>  	.access_type =3D ds1685_reg_indirect,
> +#ifdef CONFIG_SGI_IP30
> +	.plat_prepare_poweroff =3D ip30_prepare_poweroff,
> +#endif
>  };

[Severity: High]
What happens on a power button press when CONFIG_SGI_IP30=3Dy and
CONFIG_RTC_DRV_DS1685_FAMILY=3Dm?

Previously, ip30_rtc_platform_data.plat_prepare_poweroff was NULL, so when
rtc-ds1685 was built as a module, ds1685_rtc_extended_irq() fell back to
calling ds1685_rtc_poweroff(pdev) directly inside the module.

With this change, ip30_rtc_platform_data.plat_prepare_poweroff is wired up
whenever CONFIG_SGI_IP30 is enabled, overriding the direct
ds1685_rtc_poweroff(pdev) fallback. However, in built-in
arch/mips/sgi-ip30/ip30-power.c, IS_REACHABLE(CONFIG_RTC_DRV_DS1685_FAMILY)
is false when CONFIG_RTC_DRV_DS1685_FAMILY=3Dm:

arch/mips/sgi-ip30/ip30-power.c:ip30_machine_power_off() {
    if (!IS_REACHABLE(CONFIG_RTC_DRV_DS1685_FAMILY))
        return;
    ...
}

As a result, pm_power_off is not registered and ip30_machine_power_off() is
a no-op, so neither orderly_poweroff(true), ip30_power_timeout(), nor a
second power button press can cut power.

In addition, in ip30_prepare_poweroff(), the second-press path:

	if (ip30_shutting_down)
		ip30_machine_power_off();

has no return statement, so whenever ip30_machine_power_off() returns early
(for example when !IS_REACHABLE(CONFIG_RTC_DRV_DS1685_FAMILY) or if the
rtc-ds1685 device is unbound), execution falls through and re-runs
orderly_poweroff(true) and schedule_delayed_work(). Should plat_prepare_pow=
eroff
only be set when IS_REACHABLE(CONFIG_RTC_DRV_DS1685_FAMILY) (or Kconfig
updated so ip30-power.c can always reach the driver), and should the
second-press branch in ip30_prepare_poweroff() return?

[1] https://lore.kernel.org/r/20261013115820.13293-3-kaloz@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102094106.2130=
0-1-kaloz@kernel.org?part=3D2
