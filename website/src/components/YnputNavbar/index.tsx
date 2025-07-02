import React from "react";
import styles from "./styles.module.scss";
import clsx from "clsx";

const YnputNavbar = () => {
    return (
        <header className={clsx(styles.bHeader, styles.clearfix)}>
            <div className={styles.wrap}>
                <div className={clsx(styles.contents, styles.clearfix)}>
                    <div className={styles.title}>
                        <a href="https://hb-docs.d2-india.com">
                            <img
                                src="/img/dd_black.png"
                                alt="D D H B"
                                id="brand-logo"
                            />
                        </a>
                    </div>
                    <nav className={styles.links}>
                        <ul className={clsx(styles.nav, styles.navPills)}>
                            <li>
                                <a href="https://ynput.io/ayon/">D D A Y O N</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
    );
};

export default YnputNavbar;
