Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546A45FFC6
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807097; cv=none; b=PSeNWK6rxKJaQj5BbKupqxrdw/qjyi2ftKYdFjuq8v7xTyZLWIGt4WG0YrlW9UYPFG3BCgbLPvl9A/873Y8pGGvGjspylKtVKOyEL26kzl4wSia+HpVKTRrHb2Tm9rQxCiWzmjI5orsYX18Rd1POxMLMTSbsXQyVz4EuYoGoshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807097; c=relaxed/simple;
	bh=oJKYKPvIWR1flQf3+9jxsrU2r2Nj7GtoPNUrw1rnnQg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm1CDZiz+1LObaFP8UKrv0qQpOlQj3vhpyNghFny0+aRAqv1T7qorqrWo5Gb9X3W/MRm7Bhv+ViAYwXq5/S8YOgdZgJ/Gh1hDUQzONJeyuQkUsERJlYNZTc3EdrdxtfdpOFgAdxOMyNgPt6CcQ9MKrxAdZ66kq8xXyy4pNo6Zk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdAxEMyH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdAxEMyH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso2613012f8f.1
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791807094; x=1792411894; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sc49qqhhEyUJuK0EGs99OT0N3reB0T/TTspKz6pJo38=;
        b=HdAxEMyHfmXNHQgXoNeWjWheIkyVXcFZ8cIQXTcvxfOITttZCX3O/ngetCv3Ol898P
         qP6uIIuVW5QLY/KyaGpZG0SYD6KKpSWB8zSUkipEEs+YwLcug8O1kqVVuhMA3EvK2WxL
         Rwvl5jooO7vxMXScX96rXGuHTWQ2b5/a3AuRgzHlYLPzwt+5sDpUxInEHZgbIDK/dYqz
         MyCU35mteIwmr4DMIszljNCWeiJJh/1VpNfyLQF4wdSwAIJmkLqaS0++4uM7X7liNNrl
         6if3piMVMmUA3bPEsyql3VTyLx4bV7R0ZfPuJtbIVU9CKDxOtIWpAyBvqWLf41Qvgnvd
         Qf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807094; x=1792411894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sc49qqhhEyUJuK0EGs99OT0N3reB0T/TTspKz6pJo38=;
        b=Ej+18il9VfxjDMMj5LorNRgdO+8hDeFNssDQ7W/y700XwjtkfsGWpVMxgXZcB5ULOZ
         bjBByEhCpN4jzcgJ2+3czGCbFXFHpIlpgN+P4x42svdvJXjcfITM3UbQCYYzyTidB/sC
         SFifztGXDm+b0kYHH9wJEy0sHJEyRJgG6Vi1cnQCLLIRUwlxyC80P+iOlvDhBGexOhkg
         GpAY70SO1t8WfeKAqrhtOdiUus716yOYkdXg1qs66FpnNWODzsuIDUtWnWK8aaqZzU+I
         jDhh5TUh1vRdz6/itQvdqCX3IlPW3VT6rhU4uqWKPrFAlkqp3AEfDToMzxj6SSH8QnZA
         /L+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7IXH7WHuDcgRjVd7FOsz95GePejdithCbUiAvbsd0eAb0VtNCZuquRMmZ/e9pgqj6aoY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJfxkE56yE26qqF6F+bgeb52Ej8mXLntcSVl/ZjoBUFBpzxIKG7
	mSDlm3kdaVNhNk9Sr3j6fmyN5CLlIiQzUBjdMpcHqus8/lWyorYsenoo/yo3SQ==
X-Gm-Gg: AYBFou1v+CXiO+M4GsMJB/N6ZR0IEJw7hjEewxk20wZINmX2Li7gkWDGAT43cZg/JHI
	9AZHeL6DdQLowvbfgwp3R3vE3T0S+EKwQnltegqLTmgmcvww6Y7ANyPZTXVUZ7JfFPziLxrRGhH
	xv6OGwYbRXdynA+DJorkpAOtf3KCR9XGN9bQmwOm3MPVplyWgxnl4U9/wO1/eeuW4m80sczAMN/
	fory4vazlb0p6B7k72Jmy7y/in040bqWctBQ5L8kYD1H6IcWxS++o3T8EeQObxduz3cos70rs3U
	iUgi1SlG+F9d1BkzNYjMzrP3H3Sp1Lq26avaXVb4LSu6pvLToNDDTiXdX4SE4cIiEy6DTVHK6eJ
	mVIBtPholZEdyNTUgsUBu9xV3dQL737+92ft0WWE3dy1pgNZ+JLQkFeAfFj02qh88XFymeFn8O1
	RxWC5UuOp92PT7v1719NaYJ0+nNfuwJGOdGNWu8aE2FjXL/wV5Tu26/DEYFyWS8M7qus30zMxCQ
	bbbAkE3/yuGtqaxwI5BQljeTcuZ1cBTw1ellU+hiFkVw6fUabWgd/jni+Tg0FKLFAqf7IkeoSP7
	b37LLg==
X-Received: by 2002:a05:6000:4287:b0:48c:77ae:c39a with SMTP id ffacd0b85a97d-48db9475d10mr24395994f8f.15.1791807093405;
        Mon, 12 Oct 2026 05:11:33 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ab981asm19703461f8f.30.2026.10.12.05.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:11:32 -0700 (PDT)
Message-ID: <6accce74.66e4af69.1a0022.3cf3@mx.google.com>
X-Google-Original-Message-ID: <aszOcm9IwHY0KKpc@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:11:30 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH net-next v25 10/10] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-11-ansuelsmth@gmail.com>
 <sashiko-outbox-166723@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166723@kernel.org>

On Sat, Oct 10, 2026 at 04:11:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [High] net: dsa: an8855: Port matrix is unconditionally zeroed out during port_enable
> - [Medium] net: dsa: an8855: Unchecked regmap_read in an8855_phylink_mac_link_up causes silent register corruption
> - [Medium] net: dsa: an8855: Uninitialized stack variable read in an8855_port_fdb_dump()
> - [Medium] net: dsa: an8855: an8855_phylink_mac_enable_tx_lpi() leaves stale timer values on immediate LPI
> - [Medium] net: dsa: an8855: missing mtu_enforcement_ingress flag allows MTU violation
> - [Low] net: dsa: an8855: Driver duplicates standard UAPI statistics as private ethtool strings
> - [Low] net: dsa: an8855: an8855_port_enable() leaves priv->ports[port].enable true on error
> --
> 
> commit d3cae945049e5b42ed716ab1ac6797e64ffa036c
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
> 
> This patch adds support for the Airoha AN8855 5-Port Gigabit DSA switch,
> including phylink MAC operations and standard switch functions. It supports
> multiple port speeds, though 5G speed is currently disabled pending PCS
> configuration support.
> 
> > diff --git a/drivers/net/dsa/mediatek/an8855.c b/drivers/net/dsa/mediatek/an8855.c
> > --- /dev/null
> > +++ b/drivers/net/dsa/mediatek/an8855.c
> > @@ -0,0 +1,1765 @@
> [ ... ]
> > +static const struct mt7530_mib_desc an8855_mib[] = {
> > +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> > +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),
> > +	MIB_DESC(MT7530_MIB_TX_COLLISION, -1, "TxCollision"),
> > +	MIB_DESC(AN8855_MIB_TX_OVERSIZE_DROP, -1, "TxOversizeDrop"),
> 
> [Severity: Low]
> Is it necessary to expose these standard hardware counters through
> driver-private ethtool strings? The driver already implements the standard
> .get_eth_mac_stats interface. Exposing values like TxDrop and TxCrcErr
> via ethtool -S duplicates standard UAPI statistics, which goes against the
> Networking Drivers guidelines for standard statistics.
>

Same tretement of MT7530, these MIB doesn't reflect the standard linux
values.
 
> [ ... ]
> > +static int an8855_port_fdb_dump(struct dsa_switch *ds, int port,
> > +				dsa_fdb_dump_cb_t *cb, void *data)
> > +{
> > +	struct an8855_priv *priv = ds->priv;
> > +	int banks, count = 0;
> > +	u32 rsp;
> > +	int ret;
> > +	int i;
> > +
> > +	mutex_lock(&priv->reg_mutex);
> > +
> > +	/* Load search port */
> > +	ret = regmap_write(priv->regmap, AN8855_ATWD2,
> > +			   FIELD_PREP(AN8855_ATWD2_PORT, BIT(port)));
> > +	if (ret)
> > +		goto exit;
> > +	ret = mt7530_lib_fdb_cmd(&priv->lib_priv, MT7530_FDB_START,
> > +				 AN8855_FDB_MAT_MAC_PORT, &rsp);
> > +	if (ret < 0)
> > +		goto exit;
> > +
> > +	do {
> > +		/* From response get the number of banks to read, exit if 0 */
> > +		banks = FIELD_GET(AN8855_ATC_HIT, rsp);
> 
> [Severity: Medium]
> Could this read an uninitialized stack value? If mt7530_lib_fdb_cmd()
> succeeds but the final regmap_field_read(..., rsp) inside it fails, the
> function returns 0 without populating rsp. This would leave rsp
> uninitialized here, leading to unpredictable loop behavior when parsing FDB
> entries.
> 

This is an almost impossible scenario. If ok I can address this with a
followup.

> [ ... ]
> > +static void an8855_phylink_mac_link_up(struct phylink_config *config,
> > +				       struct phy_device *phydev, unsigned int mode,
> > +				       phy_interface_t interface, int speed,
> > +				       int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +	struct dsa_port *dp = dsa_phylink_to_port(config);
> > +	struct an8855_priv *priv = dp->ds->priv;
> > +	int port = dp->index;
> > +	u32 reg = 0;
> > +
> > +	mutex_lock(&priv->reg_mutex);
> > +
> > +	regmap_read(priv->regmap, AN8855_PMCR_P(port), &reg);
> 
> [Severity: Medium]
> What happens if this regmap_read() fails? The return value is not checked,
> so reg would remain 0. The function then sets specific bits (speed, duplex,
> TX_EN, RX_EN) and writes it back, which could silently overwrite and
> corrupt other configuration bits (like MAC mode or backoff settings) that
> were configured in an8855_phylink_mac_config().
> 

Similar to above, very unlikely scenario.

> [ ... ]
> > +static int an8855_port_enable(struct dsa_switch *ds, int port,
> > +			      struct phy_device *phy)
> > +{
> > +	struct dsa_port *dp = dsa_to_port(ds, port);
> > +	struct an8855_priv *priv = ds->priv;
> > +	int ret;
> > +
> > +	mutex_lock(&priv->reg_mutex);
> > +
> > +	/* Allow the user port gets connected to the cpu port and also
> > +	 * restore the port matrix if the port is the member of a certain
> > +	 * bridge.
> > +	 */
> > +	if (dsa_port_is_user(dp)) {
> > +		struct dsa_port *cpu_dp = dp->cpu_dp;
> > +
> > +		priv->ports[port].pm |= BIT(cpu_dp->index);
> > +	}
> > +	priv->ports[port].enable = true;
> > +	ret = regmap_fields_write(priv->lib_priv.fields[MT7530_PCR_MATRIX],
> > +				  port, 0);
> 
> [Severity: High]
> Should this be passing priv->ports[port].pm instead of 0? Writing the
> literal 0 disables the port's forwarding matrix in hardware, effectively
> isolating the port and dropping all forwarded traffic, rather than
> applying the port matrix computed just above.
> 

I can address this in follow-up patch if possible.

> [Severity: Low]
> Also, if this regmap_fields_write() fails, the function jumps to the exit
> label and returns an error without reverting priv->ports[port].enable back
> to false. Can this desynchronize the software state from the hardware state
> and cause issues in loops that check priv->ports[i].enable (such as the LPI
> timer calculation)?
> 



> > +	if (ret)
> > +		goto exit;
> > +
> > +	ret = regmap_set_bits(priv->regmap, AN8855_PMCR_P(port),
> > +			      AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> > +
> > +exit:
> > +	mutex_unlock(&priv->reg_mutex);
> > +
> > +	return ret;
> > +}
> [ ... ]
> > +static int an8855_setup(struct dsa_switch *ds)
> > +{
> [ ... ]
> > +	/* Set min a max ageing value supported */
> > +	ds->ageing_time_min = AN8855_L2_AGING_MS_CONSTANT;
> > +	ds->ageing_time_max = FIELD_MAX(AN8855_AGE_CNT) *
> > +			      FIELD_MAX(AN8855_AGE_UNIT) *
> > +			      AN8855_L2_AGING_MS_CONSTANT;
> > +
> > +	/* User reported problem with WiFi roaming and
> > +	 * ethernet port. Enabling assisted learning fix
> > +	 * the issue.
> > +	 */
> > +	ds->assisted_learning_on_cpu_port = true;
> > +
> > +	return 0;
> > +}
> 
> [Severity: Medium]
> Does this switch require the mtu_enforcement_ingress flag to be set here?
> Because mt7530_lib_port_change_mtu() configures the MTU limit globally
> based on the CPU port's requested MTU, user ports configured with smaller
> MTUs might accept oversized frames. Setting ds->mtu_enforcement_ingress =
> true would let the DSA core normalize bridged port MTUs.
> 

I will double check this.

> [ ... ]
> > +static int an8855_phylink_mac_enable_tx_lpi(struct phylink_config *config,
> > +					    u32 timer, bool tx_clock_stop)
> > +{
> [ ... ]
> > +		ret = regmap_update_bits(priv->regmap, AN8855_CKGCR,
> > +					 AN8855_LPI_TXIDLE_THD_MASK, val);
> > +		mutex_unlock(&priv->reg_mutex);
> > +		if (ret) {
> > +			dev_err(dp->ds->dev, "failed to set global LPI timer\n");
> > +			return ret;
> > +		}
> > +	} else {
> > +		ret = regmap_set_bits(priv->regmap, AN8855_PMEEECR_P(port),
> > +				      AN8855_LPI_MODE_EN);
> 
> [Severity: Medium]
> If timer == 0 is requested to enter LPI immediately, the software array
> priv->tx_lpi_timer_ports[port] is not updated to 0. If the port previously
> had a non-zero timer, won't this leave a stale value in the array? Because
> the global LPI timer is derived from the maximum of all enabled ports, a
> stale non-zero value here could artificially inflate the global threshold.
> 

I can address in follow-up patch.

> > +		if (ret) {
> > +			dev_err(dp->ds->dev, "failed to enable LPI for port %d\n",
> > +				port);
> > +			return ret;
> > +		}
> > +	}
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=10

-- 
	Ansuel
