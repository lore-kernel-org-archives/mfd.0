Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791331;
	b=IXwAWJvvfLMFM516NIGIv1/3q72b2qfyvGwyW9p8aR1milqBsO4W8VfVeDZFdN3mja/I
	 nQ4h+zvVZd4+0OLszY1O9k2jR5/JkseJniBf33gHUW4LR6iEe7KP9lpKDb39SEbrUxG53
	 BBj3o5+gvMyS8tjyNH7oNCk9X54w1F1F/DbOLHY2IqfefUExhTMapGaRuuq8FaC3uIfGn
	 +5GRB3CWBOOhw6xWMqz6/vOCwPcyETVfg1WAEhKXimXd5KVt/ndnupo7FqbNyplxHwgs8
	 4wXBVU2da6VejfUc53JgiHlwHhE9Lp4pAJxqj4LdG7UseTBBdjm9L/iOCbFXfZ1cd2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791331;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OCgPSJCtkLPChPlH/cIJkEpJiXlfTFmVvAKhTHQJgqY=;
	b=HQCcI1rq54oaWd47ZSQMD2YvEGK9y0jazpuPBXsY36cX65OlBDqW0jckZdWIaq3Dz355
	 F5noppcMSgmDUpKLvYZJtPg9JMVEQOjtHbccSMiR1jUD3j1yBkVXPQMWFu64aMD1UD537
	 5MMZVRU2WT0Jyzn+4zvJeJI8LIhc/NLAuECdOJsxz41ziNLoOPQ/T3PHMT/gqz67bZDS8
	 F2QNbOk1lZliapIo2mgQDLp0Dx68tFOkBz9sHZnqFefojso93PHPGF/px7/gmkPUL9h1Z
	 V9N715fGCxVy4d0ZkzUjh2ugy13wtvE19MMgb0JTXfT2ft++X0NfPagXHQ+RyHURmJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2HuUT3C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB59606A321;
	Fri, 27 Nov 2026 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2HuUT3C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E0D1F00897;
	Fri, 27 Nov 2026 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791330;
	bh=OCgPSJCtkLPChPlH/cIJkEpJiXlfTFmVvAKhTHQJgqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2HuUT3CnX4MStpcPpQ63AT0KBYYiJG7/NYaFsRI3bhFagI04jjiFnLu/VYq8UTRi
	 uoNN3e6RenM1WsnofSDUx01FAGpjUIKfbacGa5nXuagjz021FD5JhVR5ppYbsXHA4H
	 VSAf7F/i2KkKx5JFJEZJCjQwb5qCELRZ962+zcu8us5WvREd8SQGdO7oJtX30REAM0
	 P/bMz8A9SZG5Wvld8OEq/C9hV+hBm0vg9D/ZP3S8fbsIoUy1qpSnNqNcI6+Y5UfXUn
	 MBL3uzcaQWs2o4ld71RN0uQaLGkjp/4HquuzyQycPlSVwI6i9WsDyb4rz1RAB53I6H
	 ceU1F21fIlVCw==
Date: Fri, 27 Nov 2026 14:55:25 +0000
From: Lee Jones <lee@kernel.org>
To: aiyengar1990@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] mfd: syscon: Give each syscon its own lockdep class
Message-ID: <20261127145525.GV38590@joneslee-macbookpro.roam.internal>
References: <20261122-syscon-lockdep-v2-1-868056a6a808@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-syscon-lockdep-v2-1-868056a6a808@gmail.com>

On Sun, 22 Nov 2026, Arun Iyengar via B4 Relay wrote:

> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> All syscon regmaps share one lockdep class, as regmap_init_mmio() uses a
> static key per call site. Lockdep then mixes up unrelated syscons: on
> RK3588 the clock-gated VO1 GRF calls clk_enable() under its regmap lock,
> while the CRU's GRF gates take the SYS GRF regmap lock under enable_lock.
> This is reported as a circular dependency and disables lockdep.

This needs fixing in Regmap, not Syscon!

Have you looked into __regmap_lockdep_wrapper()?

Or perhaps 'struct regmap_config' could take an optional 'lock_key'?

> Lock each syscon regmap with its own spinlock and lockdep class.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi 5 (RK3588S) with a 7.3 based kernel that has
> out-of-tree DisplayPort patches, lockdep and KASAN on. Without the patch
> lockdep reports the cycle during boot. With it /proc/lockdep shows one
> syscon lock -> enable_lock and enable_lock -> another syscon lock, there
> is no report and lockdep stays on. Build-tested on for-mfd-next.
> 
> Applies on top of "mfd: syscon: Put the clock after regmap_exit()":
> https://lore.kernel.org/r/20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com
> 
> Developed with Claude (Anthropic), which wrote the code and the commit
> message. I reviewed every change.
> ---
> Changes in v2:
> - __acquires/__releases: name the argument, not a local (Sashiko).
> - Link to v1: https://patch.msgid.link/20261120-syscon-lockdep-v1-1-aed779a004b8@gmail.com
> ---
>  drivers/mfd/syscon.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 3ff4e024542b..480ac178968a 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -20,6 +21,7 @@
>  #include <linux/reset.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  
>  static DEFINE_MUTEX(syscon_list_lock);
>  static LIST_HEAD(syscon_list);
> @@ -29,8 +31,29 @@ struct syscon {
>  	struct regmap *regmap;
>  	struct reset_control *reset;
>  	struct list_head list;
> +	spinlock_t lock;
> +	unsigned long lock_flags;
> +	struct lock_class_key lock_key;
>  };
>  
> +static void syscon_lock(void *arg)
> +__acquires(&((struct syscon *)arg)->lock)
> +{
> +	struct syscon *syscon = arg;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&syscon->lock, flags);
> +	syscon->lock_flags = flags;
> +}
> +
> +static void syscon_unlock(void *arg)
> +__releases(&((struct syscon *)arg)->lock)
> +{
> +	struct syscon *syscon = arg;
> +
> +	spin_unlock_irqrestore(&syscon->lock, syscon->lock_flags);
> +}
> +
>  static const struct regmap_config syscon_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
> @@ -114,12 +137,21 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>  	if (!syscon_config.max_register)
>  		syscon_config.max_register_is_0 = true;
>  
> +	lockdep_register_key(&syscon->lock_key);
> +	spin_lock_init(&syscon->lock);
> +	lockdep_set_class(&syscon->lock, &syscon->lock_key);
> +	if (!syscon_config.use_hwlock) {
> +		syscon_config.lock = syscon_lock;
> +		syscon_config.unlock = syscon_unlock;
> +		syscon_config.lock_arg = syscon;
> +	}

Duplicating regmap's internal spinlock callbacks here just to give each syscon
its own 'lock_class_key' feels like working around regmap in the wrong layer.
Could we either pass a per-syscon key into __regmap_init_mmio_clk() or add an
optional 'lock_key' to 'struct regmap_config' so regmap core handles the lockdep
class directly without open-coding syscon_lock() and syscon_unlock() here?

> +
>  	regmap = regmap_init_mmio(NULL, base, &syscon_config);
>  	kfree(syscon_config.name);
>  	if (IS_ERR(regmap)) {
>  		pr_err("regmap init failed\n");
>  		ret = PTR_ERR(regmap);
> -		goto err_regmap;
> +		goto err_key;
>  	}
>  
>  	if (check_res) {
> @@ -159,6 +191,8 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>  	regmap_exit(regmap);
>  	if (!IS_ERR(clk))
>  		clk_put(clk);
> +err_key:
> +	lockdep_unregister_key(&syscon->lock_key);
>  err_regmap:
>  	iounmap(base);
>  	return ERR_PTR(ret);
> 
> ---
> base-commit: 1cb7268b6638c411fc32f373e965eb8ba9e9b2b4
> change-id: 20261115-syscon-lockdep-d133fb58c2be
> prerequisite-message-id: <20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com>
> prerequisite-patch-id: 7cf33abeabb3eeaf1ba8ac6c461726fca87702cd
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 

-- 
Lee Jones
